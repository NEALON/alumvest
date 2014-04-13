require 'spec_helper'

describe 'self-accredited investor creates investment', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
    create_self_accredited_investor
    sign_in 'investor@alumvest.com', 'secret'
  end

  it 'creates a new investment' do
    create_investment_amount
    expect(page).to have_content 'Investment amount saved.'
    expect(page).to have_content '$99.99'
  end

  it 'fails to create a new investment due to low amount' do
    create_investment_amount(@campaign.investment_term.min_investment - 1)
    expect(page).to have_content 'Amount must be at least $10.00'
  end

  it 'fails to create a new investment due to high amount' do
    create_investment_amount(@campaign.investment_term.max_investment + 1)
    expect(page).to have_content 'Amount must be no more than $100.00'
  end

  it 'creates an investor dashboard event on investment creation' do
    create_investment_amount
    visit user_investor_events_path(@user)
    expect(page).to have_content('You started an investment')
  end

  it 'does not allow editing of the amount if payment or signing has been started' do
    # TODO
  end
end