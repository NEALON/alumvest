require File.dirname(__FILE__) + '/../../spec_helper'

describe "users bancbox investor profile", :type => :feature do

  before :each do
    sign_up :investor
    click_on 'Bancbox'
  end

  it "shows" do
    page.should have_button 'Create One'
  end

  it "updates" do
    page.should have_button 'Create One'
    click_on 'Create One'
    fill_in 'bancbox_investor_first_name', :with => @first_name
    fill_in 'bancbox_investor_last_name', :with => @last_name
    fill_in 'bancbox_investor_ssn', :with => '123-45-6789'
    fill_in 'bancbox_investor_phone', :with => '1234566789'
    fill_in 'bancbox_investor_email', :with => @email
    fill_in 'bancbox_investor_date_of_birth', :with => '1975-01-01'
    fill_in 'bancbox_investor_address_1', :with => '123 st'
    fill_in 'bancbox_investor_city', :with => 'Miami'
    fill_in 'bancbox_investor_state', :with => 'FL'
    fill_in 'bancbox_investor_zip', :with => '12345'
    check "bancbox_investor_agreement"
    click_on 'Save'

    page.should_not have_button 'Create One'
    page.should have_content 'info saved'
    page.should have_content "Reference Id"
    page.should have_content "Bank Name"
    page.should have_content "Account Number"
    page.should have_content "Account Routing Number"
    page.should have_content "Account Type"
    within '#bank-name' do
      expect(page).not_to have_content("Blank")
    end
  end
end
