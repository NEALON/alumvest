require File.dirname(__FILE__) + '/../../spec_helper'

describe "users bancbox investor profile", :type => :feature do

  before :each do
    sign_up :investor
    click_on 'Bancbox Investor Profile'
  end

  it "shows" do
    page.should have_content "Name"
    page.should have_content "SSN"
    page.should have_content "Investor_Type"
    page.should have_content "Email"
    page.should have_content "Phone"
    page.should have_content "Date of Birth"
    page.should have_content "Address line 1"
    page.should have_content "Address line 2"
    page.should have_content "City, State and Zip"
  end

  it "updates" do
    page.should have_button 'Edit'
    click_on 'Edit'
    fill_in 'bancbox_investor_ssn', :with => '12345'
    click_on 'Save'
    page.should have_content 'info saved'
    page.should have_content '12345'
  end
end
