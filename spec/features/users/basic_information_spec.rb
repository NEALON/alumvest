require File.dirname(__FILE__) + '/../../spec_helper'

describe "users basic information", :type => :feature do

  before :each do
    sign_up :investor
  end

  it "shows" do
    expect(page).to have_content 'First Name'
    expect(page).to have_content 'Middle Name'
    expect(page).to have_content 'Last Name'
    expect(page).to have_content 'Gender'
    expect(page).to have_content 'Date of Birth'
    expect(page).to have_content 'SSN'
    expect(page).to have_content 'Mobile Phone'
    expect(page).to have_content 'Home Phone'
    expect(page).to have_content 'Address 1'
    expect(page).to have_content 'Address 2'
    expect(page).to have_content 'City'
    expect(page).to have_content 'State'
    expect(page).to have_content 'Zip'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Facebook'
    expect(page).to have_content 'LinkedIn'
    expect(page).to have_content 'Personal Statement'
  end

  it "updates" do
    expect(page).to have_button 'Edit'
    click_on 'Edit'
    fill_in_user_basic_info
    expect(page).to have_content 'info saved'
  end
end
