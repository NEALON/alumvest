require 'spec_helper'

describe 'accredited investor signs documents post rejection', :type => :feature do

  before :each do
    # campaign
    campaign = create_live_campaign(create_issuer.issuer)

    # investor and investment
    investment = create_investment(
        campaign,
        (@investor =
            create_accredited_investor.investor))

    # document, envelope, signing
    FactoryGirl.create(:signing,
                       :investment => investment,
                       :document => FactoryGirl.create(:signable_subscription_document),
                       :envelope => FactoryGirl.create(:envelope),
                       :status => 'signed_by_investor')

    # admin, rejecting
    admin_user = create_admin
    sign_in 'admin@alumvest.com', 'secret'
    visit investor_signings_user_admin_path(admin_user)
    click_on 'Reject'
    sign_out

    # investor returns...
    sign_in 'investor@alumvest.com', 'secret'
    visit user_investor_events_path(@investor.user)
  end

  it 'sees the rejection in their newsfeed' do
    expect(page).to have_content('One of your document signings was rejected.')
  end

  it 'returns to the signing page for the document' do
    click_on 'document signings'
    # TODO: they return to the investment documents
  end

  it 'lets them sign the document again' do
    # TODO: they are able to re-sign
  end
end

