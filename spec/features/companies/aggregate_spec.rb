require File.dirname(__FILE__) + '/../../spec_helper'

include ActionView::Helpers::SanitizeHelper
include ActionView::Helpers::DateHelper

describe "submitting a company in aggregate for review", :type => :feature do

  before :each do
    @category = FactoryGirl.create(:category)
    sign_up :owner
    @company = @owner.company
  end

  it "by successfully submitting it" do
    edit_company @company
    click_link "Check for completeness"
    (expect page).to have_content 'is complete'

    create_new_team @company
    click_link "Check for completeness"
    (expect page).to have_content 'is complete'

    create_new_investment_term @company
    click_link "Check for completeness"
    (expect page).to have_content 'are complete'

    click_link 'Submit for review'
    (expect page).to have_content 'Your company is now submitted for review'
  end

  it "by unsuccessfully submitting it" do
    #visit company_path(@company)
    #click_link 'Submit for review'
    #screenshot_and_open_image
  end
end