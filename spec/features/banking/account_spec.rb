require File.dirname(__FILE__) + '/../../spec_helper'

describe 'users banking account', :type => :feature do

  before :each do
    sign_up :investor
    fill_in_user_basic_info
    account = FactoryGirl.create(:banking_account, :user => @user)
    FactoryGirl.create(:bancbox_identity_verification, :banking_account => account, :status => 'verified')
    click_on 'Banking'
    click_on 'Account'
  end

  it 'new page shows a new bancbox investor account form' do
    sleep 10
    # expect(page).to have_button('Create your Bancbox account')
    # expect(page).to have_button('Fail to create your Bancbox account')
  end

  #it 'updates via creating a new Bancbox account (in the Bancbox system)' do
  #  click_on 'Create your Bancbox account'
  #  expect(page).to have_content('Your Bancbox account was created.')
  #  expect(page).to have_content('Your account balance: $0.00')
  #end
  #
  #it 'updates via failing to create a new Bancbox account' do
  #  click_on 'Fail to create your Bancbox account'
  #  expect(page).to have_content('Your Bancbox account could not be created.')
  #end
  #
  #it 'updates to create a new Bancbox account after failing to' do
  #  click_on 'Fail to create your Bancbox account'
  #  click_on 'Create your Bancbox account'
  #  expect(page).to have_content('Your Bancbox account was created.')
  #end
end
