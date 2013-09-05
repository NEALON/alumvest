require File.dirname(__FILE__) + '/../../spec_helper'

include ActionView::Helpers::SanitizeHelper

describe "managing team", :type => :feature do

  before :each do
    sign_up :owner
    @campaign = @owner.campaign
  end

  it "by creating one" do
    create_new_team(@campaign)
    team = Team.last
    expect(page).to have_content strip_tags team.team_highlights
    expect(page).to have_content('Campaign team info saved.')
  end

  it "by editing one" do
    create_team_via_factories(@campaign, :create)
    visit edit_campaign_team_path(@campaign)
    fill_in_team @campaign
    expect(page).to have_content('Campaign team info saved.')
  end
  
  it "by successfully submitting for review" do
    create_new_team @campaign
    click_link 'Check for completeness'
    sleep 10
    (expect page).to have_content 'is complete'
  end

  it "by unsuccessfully submitting for review" do
    create_blank_new_team @campaign
    click_link 'Check for completeness'
    (expect page).to have_content 'errors'
  end
end