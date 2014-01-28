require 'spec_helper'

describe 'managing investments', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
    sign_up :investor
    @investor.update_attribute :accredited_investor_status, 'approved'
  end

  it 'creates' do
    visit display_campaign_company_path(@campaign)
    click_link 'Invest Now'

    within('#funding') { click_on 'Start' }
    fill_in_funding_level
    #expect(page).to have_content 'Item completed.'
    within('#funding') { expect(page).to have_content('Completed') }

    within('#questionnaire') { click_on 'Start' }
    fill_in_questionnaire
    #expect(page).to have_content 'Item completed.'
    within('#questionnaire') { expect(page).to have_content('Completed') }

    # within('#contracts') {click_on 'Start'}
    #    # click_link 'Complete this item'
    # expect(page).to have_content 'Item completed.'
    # within('#contracts') {expect(page).to have_content('Completed')}
    #
    within('#subscription') { click_on 'Start' }
    click_link 'Complete this item'
    #expect(page).to have_content 'Item completed.'
    within('#subscription') { expect(page).to have_content('Completed') }

    within('#irs') { click_on 'Start' }
    click_link 'Complete this item'
    #expect(page).to have_content 'Item completed.'
    within('#irs') { expect(page).to have_content('Completed') }

    # click_link 'Submit this investment for review'
    # expect(page).to have_content 'Thank you for your investment!'
  end
end
