require File.dirname(__FILE__) + '/../../spec_helper'

describe "users basic information", :type => :feature do

  it "shows" do
    sign_up :investor

    page.should have_content 'First Name'
    page.should have_content 'Middle Name'
    page.should have_content 'Last Name'
    page.should have_content 'Gender'
    page.should have_content 'Date of Birth'
    page.should have_content 'Email'
    page.should have_content 'Facebook'
    page.should have_content 'LinkedIn'
  end
end
