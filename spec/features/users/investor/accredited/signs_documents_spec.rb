require 'spec_helper'

describe 'accredited investor signs documents', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
    create_accredited_investor
    sign_in 'investor@alumvest.com', 'secret'
    @investment = create_investment(@campaign, @user.investor)
  end

  it 'views a signable document' do
    visit campaign_investment_path(@campaign, @investment)
    click_on 'Document Signings'
    click_on 'Signable Document'
    expect(page).to have_content('Request for Signature')
  end
end