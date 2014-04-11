require 'spec_helper'

describe 'user manages settings', :type => :feature do

  before :each do
    sign_up :investor
    click_on 'User Information'
    click_on 'Settings'
  end

  it 'shows' do
    expect(page).to have_content 'Password'
    expect(page).to have_content 'Password Confirmation'
  end

  it 'updates' do
    click_on 'Edit'

    fill_in 'alumvest_user_base_password', :with => '12345678'
    fill_in 'alumvest_user_base_password_confirmation', :with => '12345678'
    click_button 'Save'

    expect(page).to have_content('Password info saved.')
  end
end
