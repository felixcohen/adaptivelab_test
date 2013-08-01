require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

require 'open-uri'
require './models/message.rb'
require './models/response_manager.rb'


ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'db/adaptive_lab.db'
)

#  Shows the index page
get '/' do
  haml :index
end

# Posted to from index, do something with the API, store responses and return json 

post '/responses' do
  messages = ResponseManager.new
  if params[:existing_ids] != ""
    messages.fetch_responses(params[:existing_ids])
  else
    messages.fetch_responses(nil)
  end
end


