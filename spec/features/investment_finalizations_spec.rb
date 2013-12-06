require File.dirname(__FILE__) + '/../spec_helper'

describe 'managing investment finalizations', :type => :feature do

  before :each do
    create_owner
    @campaign = create_live_campaign(@user.owner)
    sign_up :investor
    @investor.update_attribute :accredited_investor_status, 'approved'
  end

  it 'by creating an investment' do
    visit display_campaign_company_path(@campaign)
    click_button 'Begin Investment Process'

    within('#funding') { click_link 'Start' }
    fill_in_funding_level
    expect(page).to have_content 'Item completed.'
    within('#funding') { expect(page).to have_content('Completed') }

    within('#questionnaire') { click_link 'Start' }
    fill_in_questionnaire
    expect(page).to have_content 'Item completed.'
    within('#questionnaire') { expect(page).to have_content('Completed') }

    # within('#contracts') {click_link 'Start'}
    #    # click_link 'Complete this item'
    # expect(page).to have_content 'Item completed.'
    # within('#contracts') {expect(page).to have_content('Completed')}
    #
    within('#subscription') { click_link 'Start' }
    click_link 'Complete this item'
    expect(page).to have_content 'Item completed.'
    within('#subscription') { expect(page).to have_content('Completed') }

    within('#irs') { click_link 'Start' }
    click_link 'Complete this item'
    expect(page).to have_content 'Item completed.'
    within('#irs') { expect(page).to have_content('Completed') }

    # click_link 'Submit this investment for review'
    # expect(page).to have_content 'Thank you for your investment!'
  end
end