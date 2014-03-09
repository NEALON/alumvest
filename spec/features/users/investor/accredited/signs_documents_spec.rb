require 'spec_helper'

describe 'accredited investor signing documents', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)
    create_accredited_investor
    sign_in 'investor@alumvest.com', 'secret'
    @investment = create_investment(@campaign, @user.investor)
  end

  it 'views' do
    visit campaign_investment_path(@campaign, @investment)
    click_on 'Documents'
    click_on 'Review and Sign'
    expect(page).to have_content('Request for Signature')
  end

  it 'signs' do
    visit campaign_investment_path(@campaign, @investment)
    click_on 'Documents'
    click_on 'Review and Sign'
    click_on 'Review Document'
    click_on 'Sign Here'
    page.driver.browser.execute_script("$('.Btnyellow_reskin').click();")
    expect(page).to have_content('Document signing status has been updated.')
    expect(page).to have_content('under review')
  end

  it 'declines' do
    visit campaign_investment_path(@campaign, @investment)
    click_on 'Documents'
    click_on 'Review and Sign'
    click_on 'Decline'
    fill_in 'txtDeclineReason', :with => 'Nevermind'
    click_on 'ds_hldrBdy_dlgDecline_btnDecline_btnInline'
    expect(page).to have_content('Document signing status has been updated.')
    expect(page).to have_content('declined')
  end

  it 'postpones' do
    visit campaign_investment_path(@campaign, @investment)
    click_on 'Documents'
    click_on 'Review and Sign'
    click_on 'Finish Later'
    expect(page).to have_content('canceled')
  end

  #it 'signs on paper' do
  #  visit campaign_investment_path(@campaign, @investment)
  #  click_on 'Documents'
  #  click_on 'Review and Sign'
  #  click_on 'Sign on Paper'
  #  ## click_on 'Print and Fax'
  #  ## expect(page).to have_content('...')
  #end
end
