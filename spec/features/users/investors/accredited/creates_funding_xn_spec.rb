require 'spec_helper'

describe 'accredited investor creates funding xn', :type => :feature do

  before :each do
    create_funded_investment
  end

  it 'creates a new funding xn' do
    expect(page).to have_content('Your ACH payment has been initiated.')
  end

  it 'updates the amount invested for the campaign' do
    visit display_campaign_company_path(@campaign)
    expect(page).to have_content('$100.00')
    visit root_path
    expect(page).to have_content('$100.00')
  end
end