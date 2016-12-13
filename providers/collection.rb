#
# Cookbook Name:: solrcloud
# Definition:: solrcloud_collection
#
# Copyright 2014, Virender Khatri
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

def whyrun_supported?
  true
end

use_inline_resources

action :create do
  fail "collection #{new_resource.configset_name} is missing option :collection_config_name (zookeeper configSet)" unless new_resource.collection_config_name

  converge_by("create collection #{new_resource.configset_name} if missing \n") do
    solr_options = {
      :host => new_resource.host,
      :port => new_resource.port,
      :use_ssl => new_resource.use_ssl,
      :ssl_port => new_resource.ssl_port
    }

    collection_options = {
      :context_path   => new_resource.context_path,
      :num_shards     => new_resource.num_shards,
      :shards         => new_resource.shards,
      :router_field   => new_resource.router_field,
      :async          => new_resource.async,
      :router_name    => new_resource.router_name,
      :create_node_set        => new_resource.create_node_set,
      :max_shards_per_node    => new_resource.max_shards_per_node,
      :collection_config_name => new_resource.collection_config_name,
      :auto_add_replicas      => new_resource.auto_add_replicas
    }

    ruby_block 'debug solrcloud collection create action' do
      block do
        Chef::Log.warn "new_resource.configset_name: #{new_resource.configset_name}"
        Chef::Log.warn "new_resource.replication_factor: #{new_resource.replication_factor}"
        Chef::Log.warn "new_resource.zkhost: #{new_resource.zkhost}"
        Chef::Log.warn "solr_options: #{solr_options}"
        Chef::Log.warn "collection_options: #{collection_options}"
        Chef::Log.warn "node['solrcloud']['manage_collections']: #{node['solrcloud']['manage_collections']}"
      end
    end

    ruby_block "create collection #{new_resource.configset_name}" do
      block do
        SolrCloud::Collection.new(solr_options).create(new_resource.configset_name, new_resource.replication_factor, collection_options)
      end
      only_if { node['solrcloud']['manage_collections'] && !SolrCloud::Zk.new(new_resource.zkhost).collection?(new_resource.configset_name) }
    end
  end
end

action :delete do
  converge_by("delete collection #{new_resource.configset_name} if exists \n") do
    solr_options = {
      :host => new_resource.host,
      :port => new_resource.port,
      :use_ssl => new_resource.use_ssl,
      :ssl_port => new_resource.ssl_port
    }

    ruby_block "delete collection #{new_resource.configset_name}" do
      block do
        SolrCloud::Collection.new(solr_options).delete(new_resource.configset_name, new_resource.context_path)
      end
      only_if { node['solrcloud']['manage_collections'] && SolrCloud::Zk.new(new_resource.zkhost).collection?(new_resource.configset_name) }
    end
  end
end

action :reload do
  converge_by("reload collection #{new_resource.configset_name} if exists \n") do
    solr_options = {
      :host => new_resource.host,
      :port => new_resource.port,
      :use_ssl => new_resource.use_ssl,
      :ssl_port => new_resource.ssl_port
    }

    ruby_block "reload collection #{new_resource.configset_name}" do
      block do
        SolrCloud::Collection.new(solr_options).reload(new_resource.configset_name, new_resource.context_path)
      end
      only_if { node['solrcloud']['manage_collections'] && SolrCloud::Zk.new(new_resource.zkhost).collection?(new_resource.configset_name) }
    end
  end

end
