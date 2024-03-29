require 'spec_helper'

include ActionView::Helpers::SanitizeHelper
include ActionView::Helpers::DateHelper
include ActionView::Helpers::NumberHelper

describe 'issuer manages company', :type => :feature do

  before :each do
    sign_up :issuer
    @category = FactoryGirl.create(:category)
    @campaign = FactoryGirl.create(:campaign, :issuer => @issuer)
  end

  it 'by editing one' do
    create_new_company @campaign
    edit_company @campaign
    @company = @campaign.company
    
    expect(page).to have_content('Company saved.')
    expect(page).to have_content @company.company_name
    expect(page).to have_content @company.short_description
    expect(page).to have_content @company.company_url
    expect(page).to have_content @company.campaign_title
    expect(page).to have_content strip_tags @company.company_highlights
    expect(page).to have_content strip_tags @company.company_details
    expect(page).to have_content @company.founded_on_year
    expect(page).to have_content @company.ownership_structure
    expect(page).to have_content @company.address_1
    expect(page).to have_content @company.address_2
    expect(page).to have_content @company.city
    expect(page).to have_content @company.state
    expect(page).to have_content @company.zip
    expect(page).to have_content @company.phone
    expect(page).to have_content strip_tags @company.faq
  end

  it 'by successfully submitting for review' do
    create_new_company @campaign
    click_link 'Check for completeness'
    (expect page).to have_content 'is complete'
  end

  it 'by unsuccessfully submitting for review' do
    create_blank_new_company @campaign
    click_link 'Check for completeness'
    (expect page).to have_content 'errors'
  end
end