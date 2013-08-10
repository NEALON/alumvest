require File.dirname(__FILE__) + '/../spec_helper'

describe "company personnel management", :type => :feature do

  it "creates" do
    visit new_company_personnel_form_path

    'company_personnel_form'.tap do |form|
      'founders'.tap do |group|
        fill_in "#{form}_#{group}_attributes_0_first_name", :with => Faker::Name.first_name
        fill_in "#{form}_#{group}_attributes_0_last_name", :with => Faker::Name.last_name
      end
      'team_members'.tap do |group|
        fill_in "#{form}_#{group}_attributes_0_first_name", :with => Faker::Name.first_name
        fill_in "#{form}_#{group}_attributes_0_last_name", :with => Faker::Name.last_name
      end
      'board_members'.tap do |group|
        fill_in "#{form}_#{group}_attributes_0_first_name", :with => Faker::Name.first_name
        fill_in "#{form}_#{group}_attributes_0_last_name", :with => Faker::Name.last_name
      end
      'advisors'.tap do |group|
        fill_in "#{form}_#{group}_attributes_0_first_name", :with => Faker::Name.first_name
        fill_in "#{form}_#{group}_attributes_0_last_name", :with => Faker::Name.last_name
      end
    end

    click_button "Create Company personnel form"

    expect(page).to have_content('ok')
  end
end