#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'json_fire'

def report(msg)
  puts "error: #{msg} can not be empty"
  puts "usage: fire.rb [url] [path]"
  exit 1
end

unless $*.empty?
  url = $*[0].to_s
  path = $*[1].to_s
  report 'url' if url.empty?
  report 'path' if path.empty?
  response = JsonFire::JsonFire.send(url, path)
  puts "#{response.code} #{response.msg}"
  puts response.body
  exit 0
end

report 'url and path'
