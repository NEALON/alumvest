require File.dirname(__FILE__) + '/../spec_helper'

describe "user profiles", :type => :feature do

  #it "changes password" do
  #  sign_up :owner
  #  visit user_path(@owner.user)
  #  click_link 'Edit Profile'
  #  within("#sidebar"){click_link 'Settings'}
  #
  #  fill_in 'user_password', :with => '123456'
  #  fill_in 'user_password_confirmation', :with => '123'
  #  click_button 'Save'
  #
  #  expect(page).to have_content('Password info failed to update.')
  #
  #  fill_in 'user_password', :with => '123456'
  #  fill_in 'user_password_confirmation', :with => '123456'
  #  click_button 'Save'
  #
  #  expect(page).to have_content('Password info saved.')
  #  signout
  #  sign_in @email, '123456'
  #  expect(page).to have_link('Sign out')
  #end
end
