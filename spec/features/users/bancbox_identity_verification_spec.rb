require File.dirname(__FILE__) + '/../../spec_helper'

describe "users bancbox identity verification", :type => :feature do

  before :each do
    sign_up :investor
    click_on 'Bancbox Identity Verification'
  end

  it "shows" do
    pending
    # page.should have_content "something"
  end

  it "updates" do
    page.should have_button 'Edit'
    click_on 'Edit'
    check 'bancbox_identity_verification_is_verified'
    click_on 'Save'
    page.should have_content 'info saved'
  end
end
