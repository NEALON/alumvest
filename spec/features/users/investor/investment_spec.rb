require 'spec_helper'

describe 'users manages investments', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
    create_self_accredited_investor
    sign_in 'investor@alumvest.com', 'secret'
  end

  it 'creates a new investment' do
    create_investment_amount
    expect(page).to have_content 'Investment amount saved.'
    expect(page).to have_content '$123.45'
  end

  it 'creates an investor dashboard event on investment creation' do
    create_investment_amount
    visit user_investor_events_path(@user)
    expect(page).to have_content('You started an investment')
  end

  it 'does not allow editing of the amount if payment or signing has been started' do
    pending
  end
end