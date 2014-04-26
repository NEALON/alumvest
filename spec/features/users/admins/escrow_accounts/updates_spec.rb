require 'spec_helper'

describe 'admin updates escrow accounts', :type => :feature do

  before :each do
    create_issuer
    @campaign = create_live_campaign(@user.issuer)

    admin_user = create_admin
    sign_in 'admin@alumvest.com', 'secret'
    visit display_campaign_company_path(@campaign)
    click_on 'Edit the Escrow Account'
  end

  it 'succeeds' do
    fill_in 'bancbox_escrow_base_over_funding_amount', :with => 1000
    click_on 'Save'
  end
end