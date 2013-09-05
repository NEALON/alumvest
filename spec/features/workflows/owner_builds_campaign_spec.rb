require File.dirname(__FILE__) + '/../../spec_helper'

describe "owner builds campaign", :type => :feature do

  before :each do
    @category = FactoryGirl.create(:category)
    sign_up :owner
    @campaign = @owner.campaign
  end

  it "by creating and editing data" do
    # create
    screenshot_and_save_page if $do_screenshots
    click_link 'Owner'
    click_button 'Manage your campaign'
    fill_in_company @campaign
    click_link 'Team'
    fill_in_team @campaign
    click_link 'Investment Terms'
    fill_in_investment_term @campaign
    # edit
    click_link 'Company'
    click_link 'Edit Company'
    fill_in_company @campaign
    click_link 'Team'
    click_link 'Edit Team'
    fill_in_team @campaign
    click_link 'Investment Terms'
    click_link 'Edit Investment Terms'
    fill_in_investment_term @campaign
  end
end