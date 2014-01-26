require 'spec_helper'

describe "following company", :type => :feature do

  before :each do
    create_owner
    @campaign = create_live_campaign(@user.owner)
    sign_up :investor
  end

  it "by following one and then unfollow" do
    visit display_campaign_company_path(@campaign)
    expect(page.find(".company-follow")).to have_content('0')

    page.find("#follow-link").tap do |link|
      expect(link).not_to be_nil
      link.click
    end

    #visit user_path(@user)
    #click_link "Following Companies"
    #expect(page).to have_content(@campaign.company.company_name)

    #visit display_campaign_company_path(@campaign)
    expect(page.find(".company-follow")).not_to have_content('0')
    page.find(".btn-unfollow").tap do |link|
      expect(link).not_to be_nil
      link.click
    end

    expect(page.find(".company-follow")).to have_content('0')
  end
end
