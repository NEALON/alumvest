require File.dirname(__FILE__) + '/../spec_helper'

describe "managing investment finalizations", :type => :feature do

  before :each do
    $do_screenshots = true
    @campaign = create_live_campaign
    sign_up :investor
  end

  it "by creating an investment finalization" do
    visit display_campaign_company_path(@campaign)
    screenshot_and_save_page if $do_screenshots
    click_button "Begin investment process"
    screenshot_and_save_page if $do_screenshots

    within("#payment") {click_link 'Start'}
    fill_in_payment_information
    expect(page).to have_content "Item completed."
    within("#payment") {expect(page).to have_content("Completed")}

    screenshot_and_save_page if $do_screenshots
    within("#questionnaire") {click_link 'Start'}
    fill_in_questionnaire
    expect(page).to have_content "Item completed."
    within("#questionnaire") {expect(page).to have_content("Completed")}

    within("#identity") {click_link 'Start'}
    screenshot_and_save_page if $do_screenshots
    click_link "Complete this item"
    expect(page).to have_content "Item completed."
    within("#identity") {expect(page).to have_content("Completed")}
    screenshot_and_save_page if $do_screenshots

    within("#contracts") {click_link 'Start'}
    screenshot_and_save_page if $do_screenshots
    click_link "Complete this item"
    expect(page).to have_content "Item completed."
    within("#contracts") {expect(page).to have_content("Completed")}
    screenshot_and_save_page if $do_screenshots

    within("#subscription") {click_link 'Start'}
    screenshot_and_save_page if $do_screenshots
    click_link "Complete this item"
    expect(page).to have_content "Item completed."
    within("#subscription") {expect(page).to have_content("Completed")}
    screenshot_and_save_page if $do_screenshots

    within("#irs") {click_link 'Start'}
    screenshot_and_save_page if $do_screenshots
    click_link "Complete this item"
    expect(page).to have_content "Item completed."
    within("#irs") {expect(page).to have_content("Completed")}
    screenshot_and_save_page if $do_screenshots

    click_link "Submit this investment for review"
    expect(page).to have_content "Thank you for your investment!"
    screenshot_and_save_page if $do_screenshots
  end

  # it "by modifying an investment finalization"
  # it "by deleting an investment finalization"
end
