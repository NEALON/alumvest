require 'spec_helper'

describe 'investor dashboard displays funded investment', :type => :feature do

  before :each do
    create_funded_investment
  end

  it 'sees the event in the investor newsfeed' do
    visit user_investor_events_path(@user)
    expect(page).to have_content 'An investment of $100.00 was funded'
  end
end