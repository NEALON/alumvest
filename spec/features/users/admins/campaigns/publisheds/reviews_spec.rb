require 'spec_helper'

describe 'admin reviews published campaigns', :type => :feature do

  before :each do
    @issuer_user = create_issuer
    create_publishable_campaign(@issuer_user.issuer)
    sign_in 'issuer@alumvest.com', 'secret'
    visit campaign_company_path(@campaign)
    click_on 'Publish'
    signout

    admin_user = create_admin
    sign_in 'admin@alumvest.com', 'secret'
    visit user_admin_path(admin_user)
    click_on 'Campaign Events'
  end

  it 'sees their listing' do
    expect(page).to have_content('A campaign was published for review')
  end

  it 'reviews and chooses to accept' do
    click_on 'Accept'
    expect(page).to have_content('Campaign was reviewed and accepted.')
    expect(page).to have_content('A campaign was accepted')
    signout
    sign_in 'issuer@alumvest.com', 'secret'
    visit user_issuer_events_path(@issuer_user)
    expect(page).to have_content('Your campaign was accepted')
  end

  it 'reviews and chooses to reject' do
    click_on 'Reject'
    expect(page).to have_content('Campaign was reviewed and rejected.')
    expect(page).to have_content('A campaign was rejected')
    signout
    sign_in 'issuer@alumvest.com', 'secret'
    visit user_issuer_events_path(@issuer_user)
    expect(page).to have_content('Your campaign was rejected')
  end
end