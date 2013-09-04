require File.dirname(__FILE__) + '/../../spec_helper'

include ActionView::Helpers::SanitizeHelper
include ActionView::Helpers::DateHelper

describe "submitting a company in aggregate for review", :type => :feature do

  before :each do
    @category = FactoryGirl.create(:category)
    sign_up :owner
  end

  it "by successfully submitting it" do
    company = create_new_company
    screenshot_and_open_image
    create_new_team company
    raise company.inspect
    screenshot_and_open_image

    # create_new_investment_term company
    # click_button 'Submit for review'
    sleep 10
    # (expect page).to have_content 'is complete'
  end

  it "by unsuccessfully submitting it" do
    pending
  end
end