require File.dirname(__FILE__) + '/../../spec_helper'

describe "users demograpic info", :type => :feature do

  before :each do
    sign_up :investor
    click_on 'Demographic Info'
  end

  it "shows" do
    page.should have_content 'Mobile Phone'
    page.should have_content 'Home Phone'
    page.should have_content 'Address 1'
    page.should have_content 'Address 2'
    page.should have_content 'City'
    page.should have_content 'State'
    page.should have_content 'Zip'
    page.should have_content 'Personal Statement'
  end

  it "updates" do
    page.should have_button 'Edit'
    click_on 'Edit'
    fill_in 'demographic_mobile_phone', :with => '12345'
    click_on 'Save'
    page.should have_content 'info saved'
    page.should have_content '12345'
  end
end
