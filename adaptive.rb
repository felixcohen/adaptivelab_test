require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

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

end


