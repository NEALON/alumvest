require File.dirname(__FILE__) + '/../spec_helper'

describe 'managing investment funding level', :type => :feature do

  before :each do
    create_owner
    @campaign = create_live_campaign(@user.owner)
    @investor = create_accredited_investor
    sign_in @investor.identities.first.email, @investor.identities.first.password
  end

  it 'creates' do
    visit display_campaign_company_path(@campaign)
    click_button 'Begin Investment Process'

    within('#funding') { click_link 'Start' }

    # show available funds and allow entry, etc.
    # expect(page).to have_content available funds amount

    fill_in_funding_level
    expect(page).to have_content 'Item completed.'
    within('#funding') { expect(page).to have_content('Completed') }
  end
end