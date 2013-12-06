require File.dirname(__FILE__) + '/../../spec_helper'

describe 'users banking identity', :type => :feature do

  before :each do
    sign_up :investor
    click_on 'Banking'
  end

  it 'shows' do
    expect(page).to have_button('Verify your identity')
    expect(page).to have_button('Fail identity verification')
  end

  it 'verifies' do
    click_on 'Verify your identity'
    expect(page).to have_content('Your identity was verified.')
  end

  it 'fails' do
    click_on 'Fail identity verification'
    expect(page).to have_content('Your identity could not be verified.')
  end

  it 'verifies after failure' do
    click_on 'Fail identity verification'
    click_on 'Verify your identity'
    expect(page).to have_content('Your identity was verified.')
  end
end
