solrcloud CHANGELOG
===================

This file is used to list changes made in each version of the solrcloud cookbook.

1.1
---
 - Jontie Wakeham - Merged with local repo running solr 4.10.2

0.8.6
-----

- Virender Khatri - updated auto_java_memory to half of total memory

- Virender Khatri - added solr v5.3.1 support

- Jeff Wartes - added solr 5.4 support

- Virender Khatri - added specs #71

- Virender Khatri - allow user defined sha256sum value for solr and zookeeper #72

- Virender Khatri - need tarball attribute for custom download url #65

0.8.5
-----

- Virender Khatri - issue #40, add zookeeper chroot support

- Virender Khatri - #43, set default[solrcloud][enable_ssl] to false

- Virender Khatri - #42, add test solrcloud_test cookbook

- Virender Khatri - #44, reformat env sysconfig file parameters

- Keith Stone - allow solr to start using new init.d for version 5.2.x

- Keith Stone - default[:solrcloud][:sysconfig_file]

- Keith Stone - modify init.d template to support v5.2.x

- Virender Khatri - issue #51, add new default attribute file for v5.2.1

- Virender Khatri - issue #49, restart solr service on sysconfig and init

- Virender Khatri - updated env sysconfig solr file for v5.2.x

- Keith Stone - include missing java_options in env sysconfig solr file for v5.2.x

- Virender Khatri - issue #52 - fix solr v5.2.x service

- Dawid Romaldowski - added missing dependency (make) to build zk-gem

- Virender Khatri - #59, run apt-get update once for debian family setup

- Virender Khatri - fix for #61, #58, Issues with setting default[solrcloud][version] and wrapper cookook

- Virender Khatri - #62, optional purge old versions archive

0.6.9
-----

- Virender Khatri - issue #29, added attribute node[solrcloud][install_zk_gem]

- Grzegorz Dudek - Fixed issue #30: Attribute 'configset_name' is not used in 'zkconfigset' provider

- Virender Khatri - ignore adminPath in solr.xml for v5, issue #36

- Virender Khatri - fix rubocop lint for zkconfigset resource

- Virender Khatri - fixed travis

- Virender Khatri - bump solr version to v5.1.0

- Virender Khatri - added attributes default['solrcloud']['major_version'] & default['solrcloud']['server_base_dir_name'] in avor of solr5, issue #34

- Virender Khatri - notify solr service restart on jetty config update

- Virender Khatri - remove directory resource for symlink location node[solrcloud][shared_lib]

- Virender Khatri - cookbook now supports solr 5

- Virender Khatri - fixed LWRP zkconfigset to use attribute `configset_name` instead of `name`

0.5.8
-----

- Virender Khatri - removed empty lines

- Virender Khatri - added LWRP resource attrs to recipe collections

- Virender Khatri - added LWRP resource attrs to recipe zkconfigsets

- Virender Khatri - fixed lint config

- Virender Khatri - update solr version to 4.10.3

0.5.3
-----

- Virender Khatri - added travis ci support

0.5.2
-----

- Virender Khatri - `node['solrcloud']['zkconfigsets_home']` default directory location updated to
                    `/usr/local/solr_zkconfigsets`

- Virender Khatri - bump Apache Solr version to 4.10.2

0.5.0
-----

- Timo Schmidt - added collection lwrp action :reload to perform reload action on a collection

- Timo Schmidt - fixed typo in collection lwrp for :create action parameter router.field

- Timo Schmidt -  added context path attribute and updated reference to other configuration attributes

- Virender Khatri - init ruby spec and lint, prep for travis ci and kitchen test

0.4.8
-----

- Timo Schmidt - added collection API parameter 'autoAddReplicas'

- Virender Khatri - rubocop ready

- Virender Khatri - added solr context path to collection lwrp

- Virender Khatri - added option to restore cores configuration during upgrade by default

0.4.3
-----

- Virender Khatri - bump apache solr version to 4.10.1 after a basic test run

0.4.2
-----

- Timo Schmidt - added attribute force_upload to zkconfigset lwrp to always upload
  zkconfigsets to zookeeper, useful when manage configset separately

- Timo Schmidt - create directory for JETTY_RUN if missing for debian platform family

- Virender Khatri - added attribute for jetty context configuration

0.3.9
-----

- Virender Khatri - Fixed solr key store file generation, issue #11

0.3.8
-----

- Virender Khatri - fixed cookbook for foodcritic test passed ok

- Virender Khatri - added all zkconfig lwrp options to recipe

- Virender Khatri - added gcc dep for zk gem, issue #8

- Virender Khatri - fixed zkconfigset lwrp to upload missing zk configs, issue #7

- Timo Schmidt - removed Gem.clear_path, fix for OpsWorks runtime error, issue #5

0.3.4
-----

- Virender Khatri - fixed zk gem install patch package dependency error

0.3.3
-----

- Virender Khatri - added java dependency

0.3.2
-----

- Virender Khatri - bumped solr version to 4.10.0

- Virender Khatri - removed attribute adminPath for v4.10.0, caused startup failure

- Virender Khatri - updated README.md

- Virender Khatri - fix for foodcrtic

0.3.0
-----
- Virender Khatri - made lwrp a bit better using ruby gem zk, fix #1

- Virender Khatri - added another attribute for zookeeper configSet upload

- Virender Khatri - changed failure to raise an Exception instead of Chef::Application.fatal!

- Virender Khatri - java Options attribute is now an Array

- Virender Khatri - added Auto Java Memory attribute file

- Virender Khatri - disabled default Node zkConfigSets and collections manage attribute

- Virender Khatri - added zkConfigSets source management attribute - zkconfigsets_source

- Virender Khatri - disabled CONSOLE logging in log4j.properties and added more template attributes

0.2.8
-----
- Virender Khatri - Added node java_options attribute

- Virender Khatri - Fixed Collection LWRP for stopped solr service and in why run mode

- Updated README content with correct attributes

- Updated collection LWRP to work with solr ssl, for future cases where only ssl service port is available.

0.2.6
-----
- Virender Khatri - Fixed Typo Changes in README examples

0.2.5
-----
- Virender Khatri - Renamed solr.xml node attributes convention to generic

- Virender Khatri - Added Request Log attributes

- Virender Khatri - Added Jetty JMX

- Virender Khatri - Added JMX Authentication & Authorization

- Virender Khatri - Added Jetty SSL

- Virender Khatri - Added Solr Service Startup Wait Time attribute

- Virender Khatri - Updated configSet now will notify zookeeper upconfig

- Virender Khatri - Added Jetty Server Core attributes

- Virender Khatri - Added Jetty default connector attributes

- Virender Khatri - Added Jetty SSL connector attributes

- Virender Khatri - Added SSL key store file

- Virender Khatri - Added Default key store file generation and management

- Virender Khatri - Added User defined key store file SSL

- Virender Khatri - Separated manager attribute to  collection manager, zkconfigSet managet and zkconfigSet source manager

- Virender Khatri - Fixed collection first time run failure due to solr service down, now logs a message when solr service is down

- Virender Khatri - Updated collection LWRP, now if manage_collections is disabled, LWRP would not create collection resource

- Virender Khatri - Updated zkconfigsets LWRP, now if manage_zkconfigsets is disabled, LWRP would not create zkconfigsets zookeeper upconfig resource

- Virender Khatri - Updated zkconfigsets LWRP, now if manage_zkconfigsets_source is disabled, LWRP would not create zkconfigsets source resource

0.2.1
-----
- Virender Khatri - Updated README and CHANGELOG

0.2.0
-----
- Virender Khatri - Initial release of solrcloud

- - -
[Github Source](https://github.com/Virender Khatri/solrcloud)

Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
