# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name        = "smartdict-gtk"
  gem.homepage    = "http://github.com/greyblake/smartdict-gtk"
  gem.license     = "MIT"
  gem.summary     = %Q{GTK GUI for Smartdict dictionary}
  gem.description = %Q{GTK GUI for Smartdict dictionary}
  gem.email       = "blake131313@gmail.com"
  gem.authors     = ["Sergey Potapov"]


  gem.files = Dir.glob('./lib/**/*')
  gem.files += ['./bin/smartdict-gtk', 'GPL-LICENSE.txt', 'VERSION']
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec
