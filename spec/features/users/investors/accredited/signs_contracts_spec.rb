require 'spec_helper'

describe 'accredited investor signing documents', :type => :feature do

  before :each do
    @issuer = create_issuer.issuer
    @campaign = create_live_campaign(@issuer)

    @investor = create_accredited_investor.investor
    create_investment(@campaign, @investor)

    sign_in 'investor@alumvest.com', 'secret'
    visit campaign_investment_path(@campaign, @investment)

    FactoryGirl.create(:online_payment, :status => :funded, :investment => @investment)
    click_on 'Contracts'
  end

  it 'displays signable documents' do
    expect(page).to have_content 'Document group 1'
    expect(page).to have_link('Sign')
  end

  #it 'views' do
  #  visit campaign_investment_path(@campaign, @investment)
  #  click_on 'Documents'
  #  click_on 'Review and Sign'
  #  expect(page).to have_content('Request for Signature')
  #end

  #it 'signs' do
  #  visit campaign_investment_path(@campaign, @investment)
  #  click_on 'Documents'
  #  click_on 'Review and Sign'
  #  click_on 'Review Document'
  #
  #  TODO: execute a script to stuff some numbers in there
  #  see http://stackoverflow.com/questions/596481/simulate-javascript-key-events/596580#596580
  #script = "jQuery.event.trigger({ type : 'keypress', which : character.charCodeAt(57) });"
  #page.driver.browser.execute_script(script)
  #
  #click_on 'Sign Here'
  #page.driver.browser.execute_script("$('.Btnyellow_reskin').click();")
  #expect(page).to have_content('Document signing status has been updated.')
  #expect(page).to have_content('under review')
  #end

  #it 'declines' do
  #  visit campaign_investment_path(@campaign, @investment)
  #  click_on 'Documents'
  #  click_on 'Review and Sign'
  #  click_on 'Decline'
  #  fill_in 'txtDeclineReason', :with => 'Nevermind'
  #  click_on 'ds_hldrBdy_dlgDecline_btnDecline_btnInline'
  #  expect(page).to have_content('Document signing status has been updated.')
  #  expect(page).to have_content('declined')
  #end

  #it 'postpones' do
  #  visit campaign_investment_path(@campaign, @investment)
  #  click_on 'Documents'
  #  click_on 'Review and Sign'
  #  click_on 'Finish Later'
  #  expect(page).to have_content('canceled')
  #end

  it 'fails to communicate with docusign due to an exception' do
    $TEST_SAYS_DIE_DIE_DIE = true
    visit campaign_investment_path(@campaign, @investment)
    click_on 'Documents'
    expect(page).to have_content('exception occurred')
  end
end
