$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../spec/dummy/config/environment", __FILE__)


require 'capybara/rails'
require 'capybara/rspec'
require 'bundler/setup'
require 'docushin'
require 'pry'

RSpec.configure do |config|
  config.before(:each) do
    # Do nothing
  end
end
