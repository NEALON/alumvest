require File.dirname(__FILE__) + '/../../spec_helper'

describe "doing everything", :type => :feature do

  before :each do
    $do_screenshots = true
    @industry = FactoryGirl.create(:industry)
    @category = FactoryGirl.create(:category)
  end

  it "by creating and editing data" do
    sign_up :owner
    # create
    screenshot_and_save_page if $do_screenshots
    click_button 'Manage your company profile'
    fill_in_company_basic_form
    click_link 'People'
    fill_in_company_personnel_form
    click_link 'Funding Docs'
    fill_in_company_funding_doc_form
    click_link 'Market'
    fill_in_company_market_form
    click_link 'New campaign'
    fill_in_campaign
    screenshot_and_save_page if $do_screenshots
  end
end