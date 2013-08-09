require File.dirname(__FILE__) + '/../spec_helper'

describe "campaign management", :type => :feature do

  before :each do
    visit "/"
    page.driver.browser.manage.window.resize_to(1600,1000)
  end

  it "creates stuff" do
    visit new_campaign_worksheet_path
    fill_in 'campaign_worksheet_permalink', :with => Faker::Lorem.word
    fill_in 'campaign_worksheet_name', :with => Faker::Lorem.sentence(6)
    fill_in 'campaign_worksheet_headline', :with => Faker::Lorem.sentence(10)

    fill_in 'campaign_worksheet_summary', :with => Faker::Lorem.sentence(6)
    fill_in 'campaign_worksheet_about', :with => Faker::Lorem.sentence(6)


    click_button "Create Campaign worksheet"

    expect(page).to have_content('ok')
  end
end