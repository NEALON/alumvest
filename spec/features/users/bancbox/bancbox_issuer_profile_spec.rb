require File.dirname(__FILE__) + '/../../../spec_helper'

describe "users bancbox issuer profile", :type => :feature do

  before :each do
    sign_up :owner
    click_on @first_name
    within '.dropdown-menu' do
      click_on 'Profile'
    end
    click_on 'Bancbox'
  end

  it "shows" do
    page.should have_content "First Name"
    page.should have_content "Last Name"
    page.should have_content "SSN"
    page.should have_content "Email"
    page.should have_content "Phone"
    page.should have_content "Date of Birth"
    page.should have_content "Address line 1"
    page.should have_content "Address line 2"
    page.should have_content "City"
    page.should have_content "State"
    page.should have_content "Zip"
    page.should have_content "Reference Id"
    page.should have_content "Bank Name"
    page.should have_content "Account Number"
    page.should have_content "Account Routing Number"
    page.should have_content "Account Type"
  end

  it "updates" do
    page.should have_button 'Edit'
    click_on 'Edit'
    fill_in 'bancbox_issuer_first_name', :with => @first_name
    fill_in 'bancbox_issuer_last_name', :with => @last_name
    fill_in 'bancbox_issuer_ssn', :with => '123-45-6789'
    fill_in 'bancbox_issuer_phone', :with => '1234566789'
    fill_in 'bancbox_issuer_email', :with => @email
    fill_in 'bancbox_issuer_date_of_birth', :with => '1975-01-01'
    fill_in 'bancbox_issuer_address_1', :with => '123 st'
    fill_in 'bancbox_issuer_city', :with => 'Miami'
    fill_in 'bancbox_issuer_state', :with => 'FL'
    fill_in 'bancbox_issuer_zip', :with => '12345'
    check "bancbox_issuer_agreement"
    click_on 'Save'
    page.should have_content 'info saved'
    within '#bank-name' do
      expect(page).not_to have_content("Blank")
    end
  end
end
