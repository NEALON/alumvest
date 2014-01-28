require 'spec_helper'
include ActionView::Helpers::SanitizeHelper

describe "managing campaign teams", :type => :feature do

  before :each do
    sign_up :issuer
    @category = FactoryGirl.create(:category)
    @campaign = FactoryGirl.create(:campaign, :issuer => @issuer)
  end

  it "creates" do
    create_new_team(@campaign)
    team = Team.last
    expect(page).to have_content strip_tags team.team_highlights
    expect(page).to have_content('Campaign team info saved.')
  end

  it "updates" do
    create_team_via_factories(@campaign, :create)
    visit edit_campaign_team_path(@campaign)
    fill_in_team @campaign
    expect(page).to have_content('Campaign team info saved.')
  end
  
  it "submits for review" do
    create_new_team @campaign
    click_link 'Check for completeness'
    (expect page).to have_content 'is complete'
  end

  it "fails submission for review" do
    create_blank_new_team @campaign
    click_link 'Check for completeness'
    (expect page).to have_content 'errors'
  end
end