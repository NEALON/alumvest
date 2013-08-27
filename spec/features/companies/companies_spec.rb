require File.dirname(__FILE__) + '/../../spec_helper'

include ActionView::Helpers::SanitizeHelper

describe "managing company basics", :type => :feature do

  before :each do
    @industry = FactoryGirl.create(:industry)
    @category = FactoryGirl.create(:category)
    sign_up :owner
  end

  it "by creating one" do
    create_new_company

    company = Company.last
    expect(page).to have_content('Company saved.')

    expect(page).to have_content company.name
    expect(page).to have_content company.url
    expect(page).to have_content company.title
    expect(page).to have_content company.headline
    expect(page).to have_content strip_tags company.company_introductions
    expect(page).to have_content company.founded_on_year
    expect(page).to have_content company.ownership_structure
    expect(page).to have_content(company.category.name)
    expect(page).to have_content(company.industry.name)
    expect(page).to have_content company.address_1
    expect(page).to have_content company.address_2
    expect(page).to have_content company.city
    expect(page).to have_content company.state
    expect(page).to have_content company.zip
    expect(page).to have_content company.phone
    expect(page).to have_content company.photo_url
    # expect(page).to have_content company.video_url
    expect(page).to have_content strip_tags company.highlights
  end

  it "by editing one" do
    visit edit_company_path FactoryGirl.create(:company)
    fill_in_company
    expect(page).to have_content('Company saved.')
  end

  it "by successfully submitting for review" do
    create_new_company
    (expect page.find_by_id "status").to have_content 'Draft'
    click_link 'Submit for review'
    (expect page.find_by_id "status").to have_content 'Ready for review'
  end

  it "by unsuccessfully submitting for review" do
    create_blank_new_company
    (expect page.find_by_id "status").to have_content 'Draft'
    click_link 'Submit for review'
    (expect page).to have_content 'errors encountered'
  end
end