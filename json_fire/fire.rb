#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'json_fire'

def report(msg)
  puts "error: #{msg} can not be empty, please check fixtures/host_setting.json"
  puts "usage: fire.rb [path]"
  exit 1
end

unless $*.empty?
  path = $*[0].to_s
  report 'path' if path.empty?
  host_setting_file = File.new('./files/host_setting.json')
  host_setting = JSON.parse(host_setting_file.read, symbolize_names: true)
  host_setting_file.close
  puts 'url' if host_setting[:url].to_s.empty?
  response = JsonFire::JsonFire.send(host_setting[:url], path, host_setting)
  puts "#{response.code} #{response.msg}"
  puts response.body
  exit 0
end

report 'path'
