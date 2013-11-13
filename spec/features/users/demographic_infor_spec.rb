require File.dirname(__FILE__) + '/../../spec_helper'

describe "users demograpic info", :type => :feature do

  it "shows" do
    sign_up :investor

    click_on 'Demographic Info'

    page.should have_content 'Mobile Phone'
    page.should have_content 'Home Phone'
    page.should have_content 'Address 1'
    page.should have_content 'Address 2'
    page.should have_content 'City'
    page.should have_content 'State'
    page.should have_content 'Zip'
    page.should have_content 'Personal Statement'
  end
end
