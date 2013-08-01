ENV['PATH'] = ENV['PATH'] + ':/usr/local/bin'

require 'rubygems'
require 'bundler'
Bundler.require

set :env, :production
set :env, (ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :production)

set :protection, :except => :frame_options
disable :run

require './wowz.rb'

run Sinatra::Application
