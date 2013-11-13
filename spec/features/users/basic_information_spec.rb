require File.dirname(__FILE__) + '/../../spec_helper'

describe "users basic information", :type => :feature do

  before :each do
    sign_up :investor
  end

  it "shows" do
    page.should have_content 'First Name'
    page.should have_content 'Middle Name'
    page.should have_content 'Last Name'
    page.should have_content 'Gender'
    page.should have_content 'Date of Birth'
    page.should have_content 'Email'
    page.should have_content 'Facebook'
    page.should have_content 'LinkedIn'
  end

  it "updates" do
    page.should have_button 'Edit'
    click_on 'Edit'
    fill_in 'user_first_name', :with => 'New_name'
    click_on 'Save'
    page.should have_content 'info saved'
    page.should have_content 'New_name'
  end
end
