require 'spec_helper'

describe 'users bank accounts', :type => :feature do

  before :each do
    sign_up :issuer
    click_on 'Edit'
    fill_in_user_basic_info
    click_on 'Issuer Dashboard'
    click_on 'Bank Account'
  end

  it 'creates' do
    fill_in_user_bank_account
    expect(page).to have_content 'Your bank account information was saved.'
  end

  it 'updates' do
    fill_in_user_bank_account
    click_on 'Edit'
    fill_in_user_bank_account
    expect(page).to have_content 'Your bank account information was saved.'
  end

  it 'validates' do
    click_button 'Save'
    expect(page).to have_content('error')
  end
end
