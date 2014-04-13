require 'spec_helper'

describe 'admin reviews published campaigns', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
    create_accredited_investor
    sign_in 'investor@alumvest.com', 'secret'
    @investment = create_investment(@campaign, @user.investor)
    @payment = FactoryGirl.create(:online_payment, :investment => @investment)
    visit campaign_investment_online_payment_path(@campaign, @investment)
    click_on 'Initiate ACH Transfer'

    signout

    admin_user = create_admin
    sign_in 'admin@alumvest.com', 'secret'
    visit user_admin_path(admin_user)
    click_on 'Campaign Events'
  end

  it 'sees their listing' do
    expect(page).to have_content(' An investment of $100.00 was funded')
  end
end