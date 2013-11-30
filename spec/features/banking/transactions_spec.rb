require File.dirname(__FILE__) + '/../../spec_helper'

describe 'users banking transactions', :type => :feature do

  before :each do
    sign_up :investor
    account = FactoryGirl.create(:banking_account,
                                 :user => @user,
                                 :bancbox_identity_verification =>
                                     FactoryGirl.create(:bancbox_identity_verification,
                                                        :status => 'verified'),
                                 :bancbox_account =>
                                     FactoryGirl.create(:bancbox_account,
                                                        :status => 'created'))
    account.activate!
    click_on 'Banking'
    click_on 'Transactions'
  end

  it 'shows new transaction buttons' do
    expect(page).to have_button('Deposit')
    expect(page).to have_button('Withdrawal')
  end

  it 'deposits' do
    click_on 'Deposit'
    expect(page).to have_content('You have successfully deposited $100.00')
    expect(page).to have_content('Your account balance: $100.00')
    # shows a deposit xtn
  end

  it 'withdraws' do
    click_on 'Withdrawal'
    expect(page).to have_content('You have successfully withdrawn $100.00')
    expect(page).to have_content('Your account balance: -$100.00')
    # shows a withdrawal xtn
  end

  #it 'updates via creating a new Bancbox account (in the Bancbox system)' do
  #  click_on 'Create your Bancbox account'
  #  expect(page).to have_content('Your Bancbox account was created.')
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
