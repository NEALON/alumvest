require File.dirname(__FILE__) + '/../../spec_helper'

describe 'users investor income verification', :type => :feature do

  before :each do
    sign_up :investor
    click_on 'Investor Dashboard'
    click_on 'Income Verification'
  end

  xit 'copies existing field values' do
    # :first_name
    # :last_name
    # :address
    # :city
    # :state
    # :zip_code
    # :previous_address
    # :previous_city
    # :previous_state
    # :previous_zip
    # :ssn
    # :email
  end

  it 'creates' do
    fill_in_income_verification
    expect(page).to have_content 'Your information was saved.'
  end

  it 'validates' do
    click_button 'Save'
    expect(page).to have_content('error')
  end
end
