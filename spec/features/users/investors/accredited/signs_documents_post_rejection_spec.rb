require 'spec_helper'

describe 'accredited investor signs documents post rejection', :type => :feature do

  before :each do
    @campaign = create_live_campaign(create_issuer.issuer)
    @investment = create_investment(
        @campaign,
        (create_accredited_investor.investor))

    @signing = FactoryGirl.create(:signing,
                                  :contract_doc_group => @investment.contract_doc_group,
                                  :template => @campaign.investment_term.subscription_docs.first.template,
                                  :status => 'investor_signature_rejected')

    sign_in 'investor@alumvest.com', 'secret'
    visit campaign_investment_contract_doc_group_path(@campaign, @investment)
  end

  it do
    expect(page).to have_content('Important Document')
  end
end