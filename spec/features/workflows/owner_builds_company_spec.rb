require File.dirname(__FILE__) + '/../../spec_helper'

describe "owner managing entire company worksheet", :type => :feature do

  before :each do
    @industry = FactoryGirl.create(:industry)
    @category = FactoryGirl.create(:category)
  end

  it "by creating and editing data" do
    sign_up :owner
    # create
    click_button 'Manage your company profile'
    fill_in_company_basic_form
    click_link 'People'
    fill_in_company_personnel_form
    click_link 'Funding Docs'
    fill_in_company_funding_doc_form
    click_link 'Market'
    fill_in_company_market_form
    # edit
    click_link 'Demographic Info'
    click_link 'Edit'
    fill_in_company_basic_form
    click_link 'People'
    click_link 'Edit'
    fill_in_company_personnel_form
    click_link 'Funding Docs'
    click_link 'Edit'
    fill_in_company_funding_doc_form
    click_link 'Market'
    click_link 'Edit'
    fill_in_company_market_form
  end
end