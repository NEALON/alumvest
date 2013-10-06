require File.dirname(__FILE__) + '/../../spec_helper'

describe "managing company updates", :type => :feature do

  before :each do
    sign_up :owner
    @campaign = @owner.campaign
    @company = FactoryGirl.create(:company, :campaign => @campaign)
  end

  it "by creating one" do
    create_new_update(@company)
    expect(page).to have_content('Company update saved.')
  end

  it "by editing one" do
    # update = FactoryGirl.create(:update, :company => @company)
    # visit edit_campaign_company_updates_path(@campaign, update)
    # fill_in_update @company
    # expect(page).to have_content('Company update saved.')
  end

  it "by deleting one" do
    update = FactoryGirl.create(:update, :company => @company)
    visit campaign_company_updates_path(@campaign)
    screenshot_and_open_image
    click_link '[Delete]'
    expect(page).to have_content("Your update was deleted.")
  end
end
