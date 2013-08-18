require File.dirname(__FILE__) + '/../../spec_helper'

describe "company campaigns management", :type => :feature do

  before :each do
    @industry = FactoryGirl.create(:industry)
    @category = FactoryGirl.create(:category)
    sign_up :owner
  end

  it "creates" do
    visit new_company_basic_form_path
    click_link 'Create a campaign'
    fill_in_campaign
    expect(page).to have_content('Campaign info saved.')
  end

  it "edits" do
    visit new_company_basic_form_path
    click_link 'Create a campaign'
    fill_in_campaign
    click_link 'Edit'
  #  fill_in_company_basic_form
  #  expect(page).to have_content('Company demographic info saved.')
  end
end
