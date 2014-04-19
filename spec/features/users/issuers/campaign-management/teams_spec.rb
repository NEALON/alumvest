require 'spec_helper'
include ActionView::Helpers::SanitizeHelper

describe 'teams', :type => :feature do

  before :each do
    sign_up :issuer
    @category = FactoryGirl.create(:category)
    @campaign = FactoryGirl.create(:campaign, :issuer => @issuer)
  end

  it 'creates' do
    create_new_team(@campaign)
    team = Alumvest::TeamBase.last
    expect(page).to have_content strip_tags team.team_highlights
    expect(page).to have_content('Campaign team info saved.')
  end

  it 'updates' do
    create_team_via_factories(@campaign, :create)
    visit edit_campaign_team_path(@campaign)
    fill_in_team @campaign
    expect(page).to have_content('Campaign team info saved.')
  end

  it 'updates by adding a member' do
    create_team_via_factories(@campaign, :create)
    visit edit_campaign_team_path(@campaign)
    click_on 'Add another person'
    #<input class="form-control input-md" id="alumvest_team_base_team_members_attributes_0_first_name" name="alumvest_team_base[team_members_attributes][0][first_name]" placeholder="" type="text">
    #fill_in_team @campaign
    #expect(page).to have_content('Campaign team info saved.')
  end

  it 'updates by removing a member' do
    # create_team_via_factories(@campaign, :create)
    # visit edit_campaign_team_path(@campaign)
    # fill_in_team @campaign
    # expect(page).to have_content('Campaign team info saved.')
  end

  it 'submits for review' do
    create_new_team @campaign
    click_link 'Check for completeness'
    (expect page).to have_content 'is complete'
  end

  it 'fails submission for review' do
    create_blank_new_team @campaign
    click_link 'Check for completeness'
    (expect page).to have_content 'errors'
  end
end
