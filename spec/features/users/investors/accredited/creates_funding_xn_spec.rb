require 'spec_helper'

describe 'accredited investor creates funding xn', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
    create_accredited_investor
    sign_in 'investor@alumvest.com', 'secret'
    @investment = create_investment(@campaign, @user.investor)
    @payment = FactoryGirl.create(:online_payment, :investment => @investment)
  end

  it 'creates a new funding xn' do
    visit campaign_investment_online_payment_path(@campaign, @investment)
    click_on 'Initiate ACH Transfer'
    expect(page).to have_content('Your ACH payment has been initiated.')
  end
end