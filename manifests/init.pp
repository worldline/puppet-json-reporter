# == Class: logstash_reporter
#
# This class deploys and configures a puppet reporter to send reports to logstash
#
#
# === Parameters
#
# [*logstash_host*]
#   String.  Logstash host to write reports to
#   Default: 127.0.0.1
#
# [*logstash_port*]
#   Integer.  Port logstash is listening for tcp connections on
#   Default: 5999
#
# [*config_file*]
#   String.  Path to write the config file to
#   Default: /etc/puppet/logstash.yaml
#
# [*config_owner*]
#   String.  Owner of the config file
#
# [*config_group*]
#   String.  Group of the config file
#
# === Examples
#
# * Installation:
#     class { 'logstash_reporter': }
#
# === Authors
#
# * John E. Vincent
# * Justin Lambert <mailto:jlambert@letsevenup.com>
# * Richard Pijnenburg <mailto:richard.pijnenburg@elastic.co>
#
class json_reporter {
}

