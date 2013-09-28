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
    within("#payment") {expect(page).to have_content("Completed")}

    within("#questionnaire") {click_link 'Start'}
    click_link "Complete this item"
    expect(page).to have_content "Item completed."
    within("#questionnaire") {expect(page).to have_content("Completed")}

    within("#identity") {click_link 'Start'}
    click_link "Complete this item"
    expect(page).to have_content "Item completed."
    within("#identity") {expect(page).to have_content("Completed")}

    within("#contracts") {click_link 'Start'}
    click_link "Complete this item"
    expect(page).to have_content "Item completed."
    within("#contracts") {expect(page).to have_content("Completed")}

    within("#subscription") {click_link 'Start'}
    click_link "Complete this item"
    expect(page).to have_content "Item completed."
    within("#subscription") {expect(page).to have_content("Completed")}

    within("#irs") {click_link 'Start'}
    click_link "Complete this item"
    expect(page).to have_content "Item completed."
    within("#irs") {expect(page).to have_content("Completed")}

    click_link "Submit this investment for review"
    screenshot_and_open_image
  end

  # it "by modifying an investment finalization"
  # it "by deleting an investment finalization"
end
