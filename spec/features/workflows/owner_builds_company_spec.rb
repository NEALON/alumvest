require File.dirname(__FILE__) + '/../../spec_helper'

describe "owner managing entire company worksheet", :type => :feature do

  before :each do
    @category = FactoryGirl.create(:category)
  end

  it "by creating and editing data" do
    sign_up :owner
    @company = Company.last
    # create
    screenshot_and_save_page if $do_screenshots
    click_button 'Manage your company profile'
    click_link 'Edit'
    fill_in_company
    click_link 'Team'
    fill_in_team @company
    click_link 'Investment Terms'
    fill_in_investment_term @company
    click_link 'Market'
    fill_in_market @company
    # edit
    click_link 'Company'
    click_link 'Edit'
    fill_in_company
    click_link 'Team'
    click_link 'Edit'
    fill_in_team @company
    click_link 'Investment Terms'
    click_link 'Edit'
    fill_in_investment_term @company
    click_link 'Market'
    click_link 'Edit'
    fill_in_market @company
  end
end