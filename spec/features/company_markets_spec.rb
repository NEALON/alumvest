require File.dirname(__FILE__) + '/../spec_helper'

describe "company funding docs management", :type => :feature do

  it "creates" do
    visit new_company_market_form_path

    'company_market_form'.tap do |form|
      fill_in "#{form}_product_media_url", :with => Faker::Internet.url
      fill_in "#{form}_market_info", :with => Faker::Lorem.sentence(6)
      fill_in "#{form}_competitive_landscape", :with => Faker::Lorem.sentence(6)
    end

    click_button "Create Company market form"

    expect(page).to have_content('ok')
  end
end