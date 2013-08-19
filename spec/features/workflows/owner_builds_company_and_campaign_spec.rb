require File.dirname(__FILE__) + '/../../spec_helper'

describe "owner builds company and campaign", :type => :feature do

  before :each do
    $do_screenshots = true
    @industry = FactoryGirl.create(:industry)
    @category = FactoryGirl.create(:category)
    sign_up :owner
  end

  it "by creating them" do
    cw = FactoryGirl.create(:company_worksheet)
    FactoryGirl.create(:company_basic_form, :company_worksheet => cw)
    FactoryGirl.create(:company_funding_doc_form, :company_worksheet => cw)
    FactoryGirl.create(:company_market_form, :company_worksheet => cw)
    create_personnel_form_via_factories cw
    c = FactoryGirl.create(:campaign, :company_worksheet => cw)
    visit company_worksheet_campaign_path(cw, c)
  end
end