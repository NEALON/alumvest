require 'spec_helper'

describe 'users issuer dashboard', :type => :feature do

  before :each do
    sign_up :issuer
    click_on 'Issuer Dashboard'
  end

  it 'shows the profile' do
    expect(page).to have_content('This is the Issuer Profile')
  end

  it 'shows the newsfeed' do
    click_on 'Issuer Newsfeed'
    expect(page).to have_content('Your Issuer Newsfeed')
  end

  it 'shows the campaigns' do
    click_on 'Campaigns'
    screenshot_and_open_image
  end

  it 'shows the signings' do
    pending
  end
end