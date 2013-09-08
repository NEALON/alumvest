require File.dirname(__FILE__) + '/../../spec_helper'

include ActionView::Helpers::SanitizeHelper
include ActionView::Helpers::DateHelper

describe "submitting a campaign for review", :type => :feature do

  before :each do
    @category = FactoryGirl.create(:category)
    sign_up :owner
    @campaign = @owner.campaign
  end

  it "successfully" do
    create_new_company @campaign
    click_link "Check for completeness"
    (expect page).to have_content 'is complete'

    create_new_team @campaign
    click_link "Check for completeness"
    (expect page).to have_content 'is complete'

    create_new_investment_term @campaign
    click_link "Check for completeness"
    (expect page).to have_content 'are complete'

    click_link 'Submit for review'
    (expect page).to have_content 'Your campaign is now submitted for review'

    # now, see it on the home page
    visit "/"
    screenshot_and_save_page if $do_screenshots
    click_link @campaign.company.campaign_title
    sleep 2
    screenshot_and_save_page if $do_screenshots

    click_link 'Team'
    sleep 2
    screenshot_and_save_page if $do_screenshots

    click_link 'Investment Terms'
    sleep 2
    screenshot_and_save_page if $do_screenshots

    #click_link 'Updates'
    #sleep 2
    #screenshot_and_save_page if $do_screenshots
    #
    click_link 'Join Us'
    sleep 3
    screenshot_and_save_page if $do_screenshots
  end

  it "by unsuccessfully submitting it" do
    #visit campaign_company_path(@campaign)
    #click_link 'Submit for review'
    #screenshot_and_open_image
  end
end