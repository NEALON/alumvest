require File.dirname(__FILE__) + '/../../spec_helper'

include ActionView::Helpers::SanitizeHelper

describe "managing team", :type => :feature do

  before :each do
    sign_up :owner
    @company = @owner.company
  end

  it "by creating one" do
    create_new_team(@company)
    team = Team.last
    expect(page).to have_content strip_tags team.team_highlights
    expect(page).to have_content('Company team info saved.')
  end

  it "by editing one" do
    create_team_via_factories(@company, :create)
    visit edit_company_team_path(@company)
    fill_in_team @company
    expect(page).to have_content('Company team info saved.')
  end
  
  it "by successfully submitting for review" do
    create_new_team @company
    click_link 'Check for completeness'
    sleep 10
    (expect page).to have_content 'is complete'
  end

  it "by unsuccessfully submitting for review" do
    create_blank_new_team @company
    click_link 'Check for completeness'
    (expect page).to have_content 'errors'
  end
end