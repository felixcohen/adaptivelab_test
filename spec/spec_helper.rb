require File.join(File.dirname(__FILE__), '..', 'adaptive.rb')

require 'rubygems'
require 'sinatra'
require 'rspec'
require 'factory_girl'


set :environment, :test

RSpec.configure do |config|
end