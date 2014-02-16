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
    expect(page).to have_content('Your Campaigns')
  end

  it 'shows the signings' do
    click_on 'Document Signings'
    expect(page).to have_content('Your Document Signings')
  end
end