require 'spec_helper'

describe 'users manages investments', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
  end

  it 'shows investor accreditation as not completed for a non-accredited investor' do
    create_non_accredited_investor
    sign_in 'investor@alumvest.com', 'secret'
    create_investment_amount
    click_on 'Investor Verification'
    expect(page).to have_content('verify your income')
  end

  it 'shows investor accreditation as completed for an accredited investor' do
    pending
  end

  it 're-directs to the investor dashboard to complete accreditation' do
    pending
  end
end