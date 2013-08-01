require File.dirname(__FILE__) + '/spec_helper'

describe 'Adaptive', :type => :controller do
  include Rack::Test::Methods
  FactoryGirl.find_definitions

  def app
    Sinatra::Application
  end

  before(:each) do
  	FakeWeb.clean_registry
  end
  
  #tests for app

  it 'should display the index' do
    get '/'
    last_response.should be_ok
    last_response.body.should include('Adaptive Lab Test')
  end
  
  it 'should fetch updates from the api' do
  	post '/responses'
  	last_response.should be_ok
  	last_response.body.should include('message')
  end

  it 'should handle no response from the api' do
	FakeWeb.register_uri(:get, "http://adaptive-test-api.herokuapp.com/tweets.json", :body => "Nothing found", :status => ["404", "Not Found"])
  	post '/responses'
  	last_response.should be_ok
  	last_response.body.should include('The API is unavailable')
  end

  it 'should return filtered updates' do
  	FakeWeb.register_uri(:get, "http://adaptive-test-api.herokuapp.com/tweets.json", :body => Array[FactoryGirl.attributes_for(:response).with_indifferent_access].to_json)
  	post '/responses', existing_ids: "8,10"
  	last_response.should be_ok
  	last_response.body.should_not include('message')
  end


  it 'should update the index page' do

  end

end
