require 'spec_helper'

describe 'managing investment funding level', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
    @investor = create_accredited_investor
    sign_in @investor.identities.first.email, @investor.identities.first.password
  end

  it 'creates' do
    visit display_campaign_company_path(@campaign)
    click_link 'Invest Now'
    within('#funding') {click_link 'Start'}
    fill_in_funding_level
    expect(page).to have_content('Completed')
  end

  it 'input a few invalid numbers' do
    visit display_campaign_company_path(@campaign)
    click_link 'Invest Now'
    within('#funding') {click_link 'Start'}
    fill_in_funding_level 'not-a-valid-num'
    expect(page).to have_content('error encountered')
    fill_in_funding_level 1000000000
    expect(page).to have_content('error encountered')
    fill_in_funding_level
    expect(page).to have_content('Completed')
  end

  it 'funds a bancbox escrow account' do
    visit display_campaign_company_path(@campaign)
    click_link 'Invest Now'
    within('#funding') {click_link 'Start'}
    fill_in_funding_level
    expect(page).to have_content('Completed')
  end
end
