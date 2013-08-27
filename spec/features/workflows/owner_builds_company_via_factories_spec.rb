require File.dirname(__FILE__) + '/../../spec_helper'

describe "owner builds company (with factories)", :type => :feature do

  before :each do
    $do_screenshots = false
    @industry = FactoryGirl.create(:industry)
    @category = FactoryGirl.create(:category)
    sign_up :owner
  end

  it "by creating them" do
    c = FactoryGirl.create(:company, :owner => @owner)
    FactoryGirl.create(:investment_term, :company => c)
    FactoryGirl.create(:market, :company => c)
    create_team_via_factories c
  end
end