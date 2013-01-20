source "http://rubygems.org"

def local_gem(gem_name)
  path = File.expand_path("../../#{gem_name}", __FILE__)
  gem gem_name, :path => path
end

#local_gem "smartdict-core"
#local_gem "smartdict-icons"

gem "smartdict-core", "~> 0.1.0"
gem "smartdict-icons"

gem 'gtk2', "1.1.2"
gem 'activesupport', "~> 3.2.0"

# core dependecies
gem 'dm-enum'
gem 'builder'

group :development do
  gem "rspec", "~> 2.7"
  gem "bundler", "~> 1.2"
  gem "jeweler", "~> 1.6.4"
  gem 'pry'

  # For cucumber testing
  gem 'aruba', '0.4.11'
end
