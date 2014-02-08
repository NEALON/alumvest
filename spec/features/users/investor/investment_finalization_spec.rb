require 'spec_helper'

describe 'users manages investment finalization', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
    create_accredited_investor
    sign_in 'investor@alumvest.com', 'secret'
  end

  it 'creates an investor dashboard event when they begin a finalization' do
    visit display_campaign_company_path(@campaign)
    click_on 'Invest Now'
    screenshot_and_open_image
  end

  it 'shows step 1 as completed for an accredited investor' do
  end

  it 'redirects to an existing finalization if already present' do
  end
end