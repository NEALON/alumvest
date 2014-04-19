require 'spec_helper'

describe 'admin creates an escrow account for accepted campaigns', :type => :feature do

  before :each do
    @issuer_user = create_issuer
    create_published_campaign(@issuer_user.issuer)

    admin_user = create_admin
    sign_in 'admin@alumvest.com', 'secret'
    visit user_admin_path(admin_user)
    click_on 'Campaign Events'
    click_on 'Accept'
  end

  it 'sees their listing' do
    expect(page).to have_content('A campaign was accepted')
  end

  it 'succeeds' do
    click_on 'Create an Escrow Account'
    # TODO: finish this test
  end

  it 'fails due to issuer not having a bancbox issuer account' do
    click_on 'Create an Escrow Account'
    expect(page).to have_content('The campaign issuer needs to have an account on Bancbox')
  end
end