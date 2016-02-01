require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'puppet'
require 'json'
require 'time'

unless Puppet.version >= '2.6.5'
  fail "This report processor requires Puppet version 2.6.5 or later"
end

Puppet::Reports.register_report(:json) do

  desc <<-DESCRIPTION
  Reports status of Puppet Runs to a JSOn file for later Logstash ingestion
  DESCRIPTION

  def process

    # Push all log lines as a single message
    logs = []
    self.logs.each do |log|
      logs << log
    end

    event = Hash.new
    event["host"] = self.host
    event["@timestamp"] = Time.now.utc.iso8601
    event["@version"] = 1
    event["tags"] = ["puppet-#{self.kind}"]
    event["message"] = "Puppet run on #{self.host} #{self.status}"
    event["logs"] = logs
    event["environment"] = self.environment
    event["report_format"] = self.report_format
    event["puppet_version"] = self.puppet_version
    event["configuration_version"] = self.configuration_version
    event["status"] = self.status
    event["start_time"] = self.logs.first.time.utc.iso8601
    event["end_time"] = self.logs.last.time.utc.iso8601
    event["metrics"] = {}
    metrics.each do |k,v|
      event["metrics"][k] = {}
      v.values.each do |val|
        event["metrics"][k][val[1].tr('[A-Z ]', '[a-z_]')] = val[2]
      end
    end
        
    destfile = File.join([Puppet.settings[:statedir], "last_run_report.json"])

    File.open(destfile, 'w+', 0644) do |f|
	f.puts(event.to_json)
    end

  end
end
