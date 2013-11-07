require File.dirname(__FILE__) + '/../spec_helper'

describe "docusign", :type => :feature do

  before :each do
    @template = FactoryGirl.create(:template, :template_id => '04A23610-C1A5-4DDA-8339-7690DFDF92F0')
    @envelope = @template.create_envelope({:name => 'Mike Pence', :email => 'mike.pence@gmail.com'})
  end

  it "should create create an envelope from a template" do
    @envelope.uri.should_not be_nil
  end

  it "should create an embed url from an envelope" do
    result = @envelope.get_recipient_view
    result.should_not be_nil
  end
end
