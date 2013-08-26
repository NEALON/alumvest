require File.dirname(__FILE__) + '/../../spec_helper'

describe "owner builds company (with factories)", :type => :feature do

  before :each do
    $do_screenshots = false
    @industry = FactoryGirl.create(:industry)
    @category = FactoryGirl.create(:category)
    sign_up :owner
  end

  it "by creating them" do
    cw = FactoryGirl.create(:company_worksheet, :owner => @owner)
    FactoryGirl.create(:company, :company_worksheet => cw)
    FactoryGirl.create(:investment_term, :company_worksheet => cw)
    FactoryGirl.create(:market, :company_worksheet => cw)
    create_team_via_factories cw
  end
end