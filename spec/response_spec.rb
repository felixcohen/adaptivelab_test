require File.dirname(__FILE__) + '/spec_helper'

describe 'Adaptive', :type => :controller do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
  
  #tests for app

  it 'should display the index' do
    get '/'
    last_response.should be_ok
    last_response.body.should include('Adaptive Lab Test')
  end
  
  it 'should fetch updates from the api' do

  end

  it 'should handle no response from the api' do

  end

  it 'should filter updates from the api' do

  end


  it 'should return filtered updates' do

  end

  it 'should update the index page' do

  end

end
