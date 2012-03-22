source "http://rubygems.org"

def local_gem(gem_name)
  path = File.expand_path("../../#{gem_name}", __FILE__)
  gem gem_name, :path => path
end

local_gem "smartdict-core"
local_gem "smartdict-icons"

gem 'gtk2'

# core dependecies
gem 'dm-enum'
gem 'builder'

group :development do
  gem "rspec", "~> 2.3.0"
  gem "bundler", "~> 1.0.0"
  gem "jeweler", "~> 1.6.4"
end
