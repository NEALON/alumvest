require 'spec_helper'

describe "managing company investment terms", :type => :feature do

  before :each do
    sign_up :issuer
    @category = FactoryGirl.create(:category)
    @campaign = FactoryGirl.create(:campaign, :issuer => @issuer)
  end

  it "by creating one" do
    create_new_investment_term(@campaign)
    expect(page).to have_content('Campaign investment terms saved.')
  end
  
  it "by editing one" do
    FactoryGirl.create(:investment_term, :campaign => @campaign)
    visit edit_campaign_investment_term_path(@campaign)
    fill_in_investment_term @campaign
    expect(page).to have_content('Campaign investment terms saved.')
  end
  
  it "by successfully submitting for review" do
    create_new_investment_term @campaign
    click_link 'Check for completeness'
    (expect page).to have_content 'are complete'
  end

  it "by unsuccessfully submitting for review" do
    create_blank_new_investment_term @campaign
    click_link 'Check for completeness'
    (expect page).to have_content 'errors'
  end
end