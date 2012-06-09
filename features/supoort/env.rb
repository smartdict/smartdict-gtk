require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end


# For development
parent_dir = File.expand_path('../../../', __FILE__)
Dir["#{parent_dir}/smartdict-*/lib"].each do |lib_dir|
  $LOAD_PATH.unshift(lib_dir) if Dir.exists?(lib_dir)
end


$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')
require 'smartdict-gtk'

require 'rspec/expectations'
require 'aruba/cucumber'

ENV["SMARTDICT_ENV"] = 'cucumber'
#ENV['PATH'] = "#{Smartdict.root_dir}/bin:" + ENV['PATH']
ENV['PATH'] = File.expand_path("../../../bin", __FILE__) + ":"  + ENV['PATH']

Smartdict.env = :cucumber
FileUtils.rm_rf(Smartdict.user_dir)

Before do
  @aruba_timeout_seconds = 10
end
