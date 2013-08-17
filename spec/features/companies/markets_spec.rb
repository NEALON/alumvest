require File.dirname(__FILE__) + '/../../spec_helper'

describe "company markets management", :type => :feature do

  before :each do
    sign_up :owner
  end
  
  it "creates" do
    visit new_company_market_form_path
    fill_in_company_market_form
    expect(page).to have_content('Company market info saved.')
  end
  
  it "edits" do
    visit new_company_market_form_path
    fill_in_company_market_form
    click_link 'Edit'
    fill_in_company_market_form
    expect(page).to have_content('Company market info saved.')
  end
end