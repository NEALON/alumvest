require 'spec_helper'

describe 'users manages investments', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
  end

  it 'allows self-accredited investor to verify his income' do
    create_non_accredited_investor
    sign_in 'investor@alumvest.com', 'secret'
    create_investment_amount
    click_on 'Investor Verification'
    click_on 'verify your income'
    expect(page).to have_content('Income Verification')
  end
end