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

  it 'sees the event in the investor newsfeed' do
    visit campaign_investment_online_payment_path(@campaign, @investment)
    click_on 'Initiate ACH Transfer'
    visit user_investor_events_path(@user)
    expect(page).to have_content 'An investment of $100.00 was funded for BionicEyez See More less than a minute ago.'
  end

  it 'sees the event in the issuer newsfeed' do
    visit campaign_investment_online_payment_path(@campaign, @investment)
    click_on 'Initiate ACH Transfer'

    signout
    sign_in 'issuer@alumvest.com', 'secret'

    visit user_issuer_events_path(@user)
    expect(page).to have_content 'An investment of $100.00 was funded for BionicEyez See More less than a minute ago.'
  end
end