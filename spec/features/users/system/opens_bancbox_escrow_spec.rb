require 'spec_helper'

include ActionView::Helpers::SanitizeHelper
include ActionView::Helpers::DateHelper

describe 'system opens bancbox escrow', :type => :feature do

  # intended to capture the system realizing that the bancbox_escrow was opened
  # by executing a call to the bancbox API

  before :each do
    @issuer = create_issuer.issuer
    @campaign = create_accepted_campaign_with_escrow(@issuer)
    @campaign.bancbox_escrow.update_from_server!

    sign_in 'issuer@alumvest.com', 'secret'
    visit user_issuer_events_path(@issuer.user)
  end

  it do
    expect(page).to have_content('The Bancbox escrow account was approved and opened')
  end
end

