require 'spec_helper'

describe 'accredited investor manages online payment', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
    create_accredited_investor
    sign_in 'investor@alumvest.com', 'secret'
    @investment = create_investment(@campaign, @user.investor)
  end

  it 'creates successfully' do
    visit campaign_investment_path(@campaign, @investment)
    click_on 'Payment'
    fill_in_online_payment
    expect(page).to have_content('Account information for online payment saved.')
  end

  it 'cannot create due to failing validations' do
    visit campaign_investment_path(@campaign, @investment)
    click_on 'Payment'
    click_on 'Save'
    expect(page).to have_content('3 errors were encountered')
  end

  it 'edits successfully' do
    FactoryGirl.create(:online_payment, :investment => @investment)
    visit campaign_investment_online_payment_path(@campaign, @investment)
    click_on 'Edit'
    fill_in_online_payment
    expect(page).to have_content('Account information for online payment saved.')
  end
end