require File.dirname(__FILE__) + '/../spec_helper'

describe "company basics management", :type => :feature do

  before :each do
    @industry = FactoryGirl.create(:industry)
    @category = FactoryGirl.create(:category)
  end

  it "creates" do
    visit new_company_basic_form_path

    'company_basic_form'.tap do |form|
      fill_in "#{form}_name", :with => Faker::Lorem.sentence(3)
      fill_in "#{form}_logo_url", :with => Faker::Internet.url
      fill_in "#{form}_url", :with => Faker::Internet.url
      fill_in "#{form}_address_1", :with => Faker::Address.street_address
      fill_in "#{form}_address_2", :with => Faker::Address.secondary_address
      fill_in "#{form}_city", :with => Faker::Address.city
      fill_in "#{form}_state", :with => Faker::Address.state_abbr
      fill_in "#{form}_zip", :with => Faker::Address.zip_code
      fill_in "#{form}_phone", :with => Faker::PhoneNumber.phone_number
      select '2008', :from => "#{form}_founded_on_1i"
      select 'January', :from => "#{form}_founded_on_2i"
      select '1', :from => "#{form}_founded_on_3i"
      fill_in "#{form}_summary", :with => Faker::Lorem.sentence(20)
      select @category.name, :from => "#{form}_category_id"
      select @industry.name, :from => "#{form}_industry_id"
    end

    click_button "Create Company basic form"

    expect(page).to have_content('ok')
  end
end