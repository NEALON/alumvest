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
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Facebook'
    expect(page).to have_content 'LinkedIn'
  end

  it "updates" do
    expect(page).to have_button 'Edit'
    click_on 'Edit'
    fill_in 'user_first_name', :with => 'New_name'
    click_on 'Save'
    expect(page).to have_content 'info saved'
    expect(page).to have_content 'New_name'
  end
end
