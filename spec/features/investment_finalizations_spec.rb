require File.dirname(__FILE__) + '/../spec_helper'

describe "managing investment finalizations", :type => :feature do

  before :each do
    $do_screenshots = false
    @campaign = create_live_campaign
    sign_up :investor
  end

  it "by creating an investmen finalization" do
    visit display_campaign_company_path(@campaign)
    click_button "Begin investment process"

    within("#payment") {click_link 'Start'}
    click_link "Complete this item"
    expect(page).to have_content "Item completed."

    within("#questionnaire") {click_link 'Start'}
    click_link "Complete this item"
    expect(page).to have_content "Item completed."

    within("#identity") {click_link 'Start'}
    click_link "Complete this item"
    expect(page).to have_content "Item completed."

    within("#contracts") {click_link 'Start'}
    click_link "Complete this item"
    expect(page).to have_content "Item completed."

    within("#subscription") {click_link 'Start'}
    click_link "Complete this item"
    expect(page).to have_content "Item completed."

    within("#irs") {click_link 'Start'}
    click_link "Complete this item"
    expect(page).to have_content "Item completed."


    #fill_in_investment
    #expect(page).to have_content("Campaign investment saved. Thank you!")
    #within("#investor_count") {expect(page).to have_content("1")}
    #within("#amount_invested") {expect(page).to have_content("$100")}
    #screenshot_and_open_image
    #
    #visit "/"
    #expect(page).to have_content(@campaign.company.campaign_title)
    #screenshot_and_save_page if $do_screenshots
    #
    #visit user_path(@user)
    #click_link "Investments"
    #screenshot_and_save_page if $do_screenshots
  end

  # it "by modifying an investment finalization"
  # it "by deleting an investment finalization"
end
