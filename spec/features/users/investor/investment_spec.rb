require 'spec_helper'

describe 'users manages investments', :type => :feature do

  def create_investment
    visit display_campaign_company_path(@campaign)
    click_on 'Invest Now'
    fill_in_investment_amount 123.45
  end

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
    create_accredited_investor
    sign_in 'investor@alumvest.com', 'secret'
  end

  it 'creates a new investment' do
    create_investment
    expect(page).to have_content 'Investment amount saved.'
    expect(page).to have_content '$123.45'
  end

  it 'shows investor accreditation as not completed for a non-accredited investor' do
    create_investment
    click_on 'Investor Verification'
    expect(page).to have_content('something')
  end

  it 'shows investor accreditation as completed for an accredited investor' do
    pending
  end


  it 're-directs to the investor dashboard to complete accreditation' do
    pending
  end

  it 'creates an investor dashboard event when they begin a finalization' do
    pending
  end

  it 'redirects to an existing investment if already present' do
    pending
  end

  it 'disables subsequent steps until an investment amount is entered' do
    pending
  end

  it 'does not allow editing of the amount if payment or signing has been started' do
    pending
  end
end