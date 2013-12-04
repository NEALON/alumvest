require File.dirname(__FILE__) + '/../spec_helper'

describe 'managing payment information', :type => :feature do

  before :each do
    create_owner
    @campaign = create_live_campaign(@user.owner)
    @investor = create_accredited_investor
    sign_in @investor.identities.first.email, @investor.identities.first.password
  end

  it 'by creating an investment finalization' do
    visit display_campaign_company_path(@campaign)
    click_button 'Begin Investment Process'

    within('#payment') {click_link 'Start'}

    # expect(page).to have_content minimum investment amount
    # expect(page).to have_content maximum investment amount
    # expect(page).to have_content available funds amount

    fill_in_payment_information
    expect(page).to have_content 'Item completed.'
    within('#payment') {expect(page).to have_content('Completed')}
  end
end