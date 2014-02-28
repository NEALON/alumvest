require 'spec_helper'

describe 'accredited investor creates funding xn', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
    create_accredited_investor
    sign_in 'investor@alumvest.com', 'secret'
    @investment = create_investment(@campaign, @user.investor)
  end

  it 'creates a new funding xn' do
    visit campaign_investment_path(@campaign, @investment)
    # TODO
  end
end