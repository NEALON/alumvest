require 'spec_helper'

describe 'issuer browses dashboard', :type => :feature do

  before :each do
    sign_up :issuer
    click_on 'Issuer Dashboard'
  end

  it 'shows the profile' do
    expect(page).to have_content('Your Issuer Profile')
  end

  it 'shows the newsfeed' do
    click_on 'Issuer Newsfeed'
    expect(page).to have_content('Your Issuer Newsfeed')
  end

  it 'shows the campaign creation button' do
    click_on 'Campaign'
    expect(page).to have_content('Your Campaign')
    expect(page).to have_link('Create your campaign')
  end

  it 'shows the campaign' do
    create_live_campaign(@issuer)
    click_on 'Campaign'
    expect(page).to have_link('Edit')
    expect(page).to have_link('Display')
  end

  it 'shows the signings' do
    click_on 'Document Signings'
    expect(page).to have_content('Your Document Signings')
  end
end