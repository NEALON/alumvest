require File.dirname(__FILE__) + '/../../spec_helper'

include ActionView::Helpers::SanitizeHelper
include ActionView::Helpers::DateHelper

describe "managing company basics", :type => :feature do

  before :each do
    @category = FactoryGirl.create(:category)
    sign_up :owner
    @company = @owner.company
  end

  it "by editing one" do
    edit_company @company
    
    expect(page).to have_content('Company saved.')
    expect(page).to have_content @company.company_name
    expect(page).to have_content @company.short_description
    expect(page).to have_content @company.company_url
    expect(page).to have_content @company.campaign_title
    expect(page).to have_content strip_tags @company.company_highlights
    expect(page).to have_content strip_tags @company.company_details
    expect(page).to have_content @company.founded_on_year
    expect(page).to have_content @company.ownership_structure
    expect(page).to have_content(@company.category.name)
    expect(page).to have_content @company.address_1
    expect(page).to have_content @company.address_2
    expect(page).to have_content @company.city
    expect(page).to have_content @company.state
    expect(page).to have_content @company.zip
    expect(page).to have_content @company.phone
    expect(page).to have_content strip_tags @company.faq
    # expect(page).to have_content @company.video_url
    # expect(page).to have_css("img[src$='#{@company.photo_url}']")
    # expect(page).to have_css("img[src$='#{@company.banner_photo_url}']")
    
  end

  it "by successfully submitting for review" do
    create_new_company
    click_link 'Check for completeness'
    (expect page).to have_content 'is complete'
  end

  it "by unsuccessfully submitting for review" do
    create_blank_new_company
    click_link 'Check for completeness'
    (expect page).to have_content 'errors'
  end

  it "by showing a company as a campaign" do
    edit_company @company
    investment_term = FactoryGirl.create(:investment_term, :company => @company)
    team = FactoryGirl.create(:team, :company => @company)

    visit campaign_path(@company)
    # expect(page).to have_css("img[src$='#{@company.banner_photo_url}']")
    expect(page).to have_content @company.company_name
    expect(page).to have_content @company.short_description
    expect(page).to have_content @company.founded_on_year
    # expect(page).to have_content @company.category.name
    expect(page).to have_content @company.campaign_title
    expect(page).to have_content strip_tags @company.company_details
    # TODO: video_url
    expect(page).to have_content strip_tags @company.faq
    expect(page).to have_content investment_term.fundraising_amount
    expect(page).to have_content investment_term.campaign_length
    expect(page).to have_content @company.company_url
    expect(page).to have_content strip_tags @company.company_highlights
  end
end