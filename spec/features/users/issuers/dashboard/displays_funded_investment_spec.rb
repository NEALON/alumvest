require 'spec_helper'

describe 'issuers dashboard displays funded investment', :type => :feature do

  before :each do
    create_funded_investment
    sign_out
    sign_in 'issuer@alumvest.com', 'secret'
  end

  it 'sees the event in the issuer newsfeed' do
    visit user_issuer_events_path(@issuer.user)
    expect(page).to have_content 'An investment of $100.00 was funded'
  end

  it 'displays investment information' do
    visit user_issuer_campaign_investments_path(@issuer.user)
    expect(page).to have_content('$100')
  end
end