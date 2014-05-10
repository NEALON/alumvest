require 'spec_helper'

describe 'non-accredited investor follows company', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
    sign_up :investor
  end

  it 'by following one and then unfollow' do
    visit display_campaign_company_path(@campaign)
    expect(page.find('.company-follow')).to have_content('0')
    click_on 'Follow this Campaign'
    expect(page).to have_content('Un-follow this Campaign')
  end
end