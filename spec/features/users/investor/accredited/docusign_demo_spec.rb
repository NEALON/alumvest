require 'spec_helper'

describe 'docusign demo', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
    create_accredited_investor
    sign_in 'investor@alumvest.com', 'secret'
    @investment = create_investment(@campaign, @user.investor)
  end

  it 'signs document' do
    visit campaign_investment_path(@campaign, @investment)
    click_on 'Documents'
    click_on 'Review and Sign'
    expect(page).to have_content('Request for Signature')
    click_on 'Review Document'
    click_on 'Sign Here'
    page.driver.browser.execute_script("$('.Btnyellow_reskin').click();")
    sleep 3
  end
end
