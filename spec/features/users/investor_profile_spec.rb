require File.dirname(__FILE__) + '/../../spec_helper'

describe "users investor profile", :type => :feature do

  it "shows" do
    sign_up :investor

    click_on 'Investor Profile'

    page.should have_content 'SSN'
    page.should have_content 'Marital Status'
    page.should have_content 'Financial Info'
    page.should have_content 'Spending Habits'
    page.should have_content 'Income'
    page.should have_content 'Income Type'
    page.should have_content 'Net Worth'
    page.should have_content 'Investor Representations'
    page.should have_content 'Company'
    page.should have_content 'Job Title'
    page.should have_content 'Experience'
    page.should have_content 'Expertise'
    page.should have_content 'Personal Message'
  end
end
