require 'spec_helper'

include ActionView::Helpers::SanitizeHelper
include ActionView::Helpers::DateHelper

describe 'submitting a campaign for review', :type => :feature do

  before :each do
    sign_up :issuer
    @category = FactoryGirl.create(:category)
    @campaign = FactoryGirl.create(:campaign, :issuer => @issuer)
  end

  it 'successfully' do
    create_new_company @campaign
    click_link 'Check for completeness'
    (expect page).to have_content 'is complete'

    create_new_team @campaign
    click_link 'Check for completeness'
    (expect page).to have_content 'is complete'

    create_new_investment_term @campaign
    click_link 'Check for completeness'
    (expect page).to have_content 'are complete'

    click_link 'Submit for review'
    (expect page).to have_content 'Your campaign is now submitted for review'

    # now, see it on the home page
    visit '/'
       click_link @campaign.company.campaign_title
    sleep 2

    click_link 'Team'
    sleep 2

    click_link 'Investment Terms'
    sleep 2

    #click_link 'Updates'
    #sleep 2
    #screenshot_and_save_page if $do_screenshots
    #
    click_link 'Join Us'
    sleep 3
  end

  it 'by unsuccessfully submitting it' do
    #visit campaign_company_path(@campaign)
    #click_link 'Submit for review'
    #screenshot_and_open_image
  end
end

describe 'preview campaign', :type => :feature do
  before :each do
    sign_up :issuer
    @category = FactoryGirl.create(:category)
    @campaign = FactoryGirl.create(:campaign, :issuer => @issuer)
  end

  it 'can preview campaign' do
    create_new_company @campaign
    click_link 'Preview'
    within_window(page.driver.browser.window_handles.last) do
      page.should have_content "This is a preview of the campaign"
    end
  end

end
