require File.dirname(__FILE__) + '/../../spec_helper'

describe "following company", :type => :feature do

  before :each do
    @campaign = create_live_campaign
    sign_up :investor
  end

  it "by following one and then unfollow" do
    visit display_campaign_company_path(@campaign)
    page.find("#followers-panel").should have_content('0')
    page.find("#followers-panel").should have_button('Follow this Campaign')
    click_button 'Follow this Campaign'

    page.find("#followers-panel").should have_button('Unfollow this Campaign')
    click_button 'Unfollow this Campaign'

    page.find("#followers-panel").should have_content('0')
  end

end
