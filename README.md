#JSON Reporter Puppet module


##Overview

This module, based on official Puppet Logstash Reporter (https://github.com/elastic/puppet-logstash-reporter), stores reports generated for LogStash ingestion into a json file. This is particularly useful if you want to send your reports over a custom protcol outside of puppet.

##Module description

The json_reporter module sets up and configures the reporter

##Setup

###The module manages the following

* reporter configuration file.

###Requirements

* `json`
* `yaml`
* Master puppet.conf needs to use the logstash reporter. 
```
[master]
report = true
reports = json
pluginsync = true
```
* Agent puppet.conf needs to send the reports to master. 
```
[agent]
report = true
pluginsync = true
```

##Usage

###Main class

####Basic usesage

```puppet
class { 'json_reporter':
}
```

##Limitations

This module has been built on and tested against Puppet 3.2 and higher.

The module has been tested on:

* Debian 6/7/8
* CentOS 6/7
* Ubuntu 12.04, 14.04
* OpenSuSE 13.x

Other distro's that have been reported to work:

* RHEL 6
* OracleLinux 6
* Scientific 6

Testing on other platforms has been light and cannot be guaranteed.

##Credits

This is a fork from https://github.com/elastic/puppet-logstash-reporter
