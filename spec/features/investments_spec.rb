require File.dirname(__FILE__) + '/../spec_helper'

# TODO: probably obsolete, given investment_finalizations

describe "managing investments", :type => :feature do

  before :each do
    $do_screenshots = false
    @campaign = create_live_campaign
    sign_up :investor
  end

  it "by creating an investment" do
    visit display_campaign_company_path(@campaign)
    click_button "Begin investment process"

    fill_in_investment
    expect(page).to have_content("Campaign investment saved. Thank you!")
    within("#investor_count") {expect(page).to have_content("1")}
    within("#amount_invested") {expect(page).to have_content("$100")}
    screenshot_and_open_image

    visit "/"
    expect(page).to have_content(@campaign.company.campaign_title)
    screenshot_and_save_page if $do_screenshots

    visit user_path(@user)
    click_link "Investments"
    screenshot_and_save_page if $do_screenshots
  end

  # it "by modifying an investment"
  # it "by deleting an investment"
end
