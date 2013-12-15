require File.dirname(__FILE__) + '/../../spec_helper'

describe 'users bank accounts', :type => :feature do

  before :each do
    sign_up :investor
    click_on 'Bank Account'
  end

  it 'creates' do
    fill_in_user_bank_account
    expect(page).to have_content 'Bank account info saved.'
  end

  it 'updates' do
    fill_in_user_bank_account
    click_on 'Edit'
    fill_in_user_bank_account
    expect(page).to have_content 'Bank account info saved.'
  end

  it 'validates' do
    click_button 'Save'
    expect(page).to have_content('errors')
  end
end
