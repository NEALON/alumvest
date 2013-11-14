require File.dirname(__FILE__) + '/../../spec_helper'

describe "users bancbox agreement profile", :type => :feature do

  before :each do
    sign_up :investor
    click_on 'Bancbox Agreement'
  end

  it "shows" do
    page.should have_content "Technology Agreement"
    page.should have_content "Platform Agreement"
    page.should have_content "Privacy Policy"
  end

  it "updates" do
    page.should have_button 'Edit'
    click_on 'Edit'
    check 'bancbox_agreement_is_agreed'
    click_on 'Save'
    page.should have_content 'info saved'
  end
end
