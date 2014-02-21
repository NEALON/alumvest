require 'spec_helper'

describe 'accredited investor signs documents', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
    create_accredited_investor
    sign_in 'investor@alumvest.com', 'secret'
    @investment = create_investment(@campaign, @user.investor)
  end

  it 'signs a document' do
    visit campaign_investment_path(@campaign, @investment)
    sleep 10
    # screenshot_and_open_image
    pending
  end
end