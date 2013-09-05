require File.dirname(__FILE__) + '/../../spec_helper'

include ActionView::Helpers::SanitizeHelper
include ActionView::Helpers::DateHelper

describe "submitting a campaign for review", :type => :feature do

  before :each do
    @category = FactoryGirl.create(:category)
    sign_up :owner
    @campaign = @owner.campaign
  end

  it "by successfully submitting it" do
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
  end

  it "by unsuccessfully submitting it" do
    #visit campaign_company_path(@campaign)
    #click_link 'Submit for review'
    #screenshot_and_open_image
  end
end