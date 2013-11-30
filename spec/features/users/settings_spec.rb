require File.dirname(__FILE__) + '/../../spec_helper'

describe "users settings", :type => :feature do

  before :each do
    sign_up :investor
    click_on 'Settings'
  end

  it "shows" do
    expect(page).to have_content 'Password'
    expect(page).to have_content 'Password Confirmation'
  end

  it "fails to update" do
    expect(page).to have_button 'Edit'
    click_on 'Edit'

    fill_in 'user_password', :with => '123456'
    fill_in 'user_password_confirmation', :with => '123'
    click_button 'Save'

    expect(page).to have_content('Password info failed to update.')
  end

  it "updates" do
    click_on 'Edit'

    fill_in 'user_password', :with => '123456'
    fill_in 'user_password_confirmation', :with => '123456'
    click_button 'Save'

    expect(page).to have_content('Password info saved.')
  end
end
