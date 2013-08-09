require File.dirname(__FILE__) + '/../spec_helper'

describe "company basics management", :type => :feature do

  before :each do
    @industry = FactoryGirl.create(:industry)
    @category = FactoryGirl.create(:category)

    before :each do
      visit "/"
      page.driver.browser.manage.window.resize_to(1600,1000)
    end
  end

  it "creates" do
    visit new_company_basic_form_path

    'company_basic_form'.tap do |form|
      fill_in "#{form}_name", :with => Faker::Lorem.word
      fill_in "#{form}_logo_url", :with => Faker::Lorem.word
      fill_in "#{form}_url", :with => Faker::Lorem.word
      fill_in "#{form}_address_1", :with => Faker::Lorem.word
      fill_in "#{form}_address_2", :with => Faker::Lorem.word
      fill_in "#{form}_city", :with => Faker::Lorem.word
      fill_in "#{form}_state", :with => Faker::Lorem.word
      fill_in "#{form}_zip", :with => Faker::Lorem.word
      fill_in "#{form}_phone", :with => Faker::Lorem.word
      select '2008', :from => "#{form}_founded_on_1i"
      select 'January', :from => "#{form}_founded_on_2i"
      select '1', :from => "#{form}_founded_on_3i"
      fill_in "#{form}_summary", :with => Faker::Lorem.word
      # fill_in "#{form}_category", :with => Faker::Lorem.word
      # fill_in "#{form}_industry", :with => Faker::Lorem.word
    end

    click_button "Create Company basic form"

    expect(page).to have_content('ok')
  end
end