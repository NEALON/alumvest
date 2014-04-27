require 'spec_helper'

describe 'admin reviews signings', :type => :feature do

  before :each do
    campaign = create_live_campaign(create_issuer.issuer)

    investment = create_investment(
        campaign,
        (create_accredited_investor.investor)
    )

    @signing = FactoryGirl.create(:signing,
                       :investment => investment,
                       :document => FactoryGirl.create(:signable_subscription_document),
                       :status => 'signed_by_investor')
    @signing.envelopes << FactoryGirl.create(:envelope, :signing => @signing)

    admin_user = create_admin
    sign_in 'admin@alumvest.com', 'secret'
    visit investor_signings_user_admin_path(admin_user)
  end

  it 'sees their listing' do
    expect(page).to have_content('Important Document')
    expect(page).to have_content('Approve')
    expect(page).to have_content('Reject')
  end

  it 'approves' do
    click_on 'Approve'
    expect(page).to have_content('Signing approved.')
  end

  it 'rejects' do
    click_on 'Reject'
    expect(page).to have_content('Signing rejected.')
    raise @signing.status
  end
end