require 'spec_helper'

describe 'admin views payments', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
    @investor = create_accredited_investor.investor
    sign_in 'investor@alumvest.com', 'secret'
    @investment = create_investment(@campaign, @user.investor)
    @payment = FactoryGirl.create(:online_payment, :investment => @investment)
    visit campaign_investment_online_payment_path(@campaign, @investment)
    click_on 'Initiate ACH Transfer'

    sign_out

    admin_user = create_admin
    sign_in 'admin@alumvest.com', 'secret'
    visit user_admin_path(admin_user)
    click_on 'Campaign Events'
  end

  it 'displays a listing' do
    expect(page).to have_content(' An investment of $100.00 was funded')
  end

  it 'displays their bancbox investments' do
    bancbox_investor = FactoryGirl.create(:bancbox_investor, :investor => @investor)
    click_on 'Bancbox Investments'
    expect(page).to have_content('$1,000.57')
  end
end