require File.dirname(__FILE__) + '/../spec_helper'

describe "managing investments", :type => :feature do

  before :each do
    $do_screenshots = false
    @campaign = create_live_campaign
    sign_up :investor
  end

  it "by creating an investment" do
    visit display_campaign_company_path(@campaign)
    click_button "Invest Now"
    fill_in_investment
    expect(page).to have_content("Campaign investment saved. Thank you!")
    within("#backer_count") do
      expect(page).to have_content("1 backer")
    end
    within("#amount_invested") do
      expect(page).to have_content("$100")
    end

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
