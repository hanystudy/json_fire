$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
$LOAD_PATH << File.join(File.dirname(__FILE__))

require 'rake'
require 'json_fire'

namespace :test do
	desc 'run tests'
	task :default => [:unit] do
	end

	desc 'run unit tests'
	task :unit do
		sh 'ruby -Ilib:test ./test/*_test.rb'
	end
end

desc 'run with rake send["http://localhost:3000/api/memberships/users","./fixtures/users.json"]'
task :send, [:url, :path] do |task, args|
	response = JsonFire::JsonFire.send(args[:url], args[:path])
  puts "#{response.code} #{response.msg}"
  puts response.body
end


task :default => %w(test:default)
