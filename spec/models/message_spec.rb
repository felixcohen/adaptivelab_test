require 'spec_helper'

describe "Message Model" do
  let(:message) { Message.new }
  it 'can be created' do
    message.should_not be_nil
  end
end
