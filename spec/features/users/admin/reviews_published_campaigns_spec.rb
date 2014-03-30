require 'spec_helper'

describe 'admin reviews published campaigns', :type => :feature do

  before :each do
    create_issuer
    create_publishable_campaign(@user.issuer)
    sign_in 'issuer@alumvest.com', 'secret'
    visit campaign_company_path(@campaign)
    click_on 'Publish'
    signout
    sign_up :admin
    u = Alumvest::User::Base.last
    u.update_attribute(:user_type, 'admin')
    visit user_admin_path(u)
    click_on 'Campaign Events'
  end

  it 'sees their listing' do
    expect(page).to have_content('A campaign was published for review')
  end

  it 'reviews and chooses to go live' do
    click_on 'Go Live'
    expect(page).to have_content('Campaign was reviewed with a Go Live outcome.')
    expect(page).to have_content('A campaign went live')
  end

  it 'reviews and chooses to reject' do
    click_on 'Reject'
    expect(page).to have_content('Campaign was reviewed with a Reject outcome.')
    sleep 10
  end

  # campaign goes live
  # creates an event in the issuer dashboard
  # creates an event in the admin dashboard
  # only live campaigns show on the home page

  # campaign is rejected
  # creates an event in the issuer dashboard
  # creates an event in the admin dashboard
end