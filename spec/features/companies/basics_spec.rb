require File.dirname(__FILE__) + '/../../spec_helper'

include ActionView::Helpers::SanitizeHelper

describe "managing company basics", :type => :feature do

  before :each do
    @industry = FactoryGirl.create(:industry)
    @category = FactoryGirl.create(:category)
    sign_up :owner
  end

  it "by creating one" do
    create_new_company_basic_form

    cbf = CompanyBasicForm.last
    expect(page).to have_content('Company demographic info saved.')

    expect(page).to have_content cbf.name
    expect(page).to have_content cbf.url
    expect(page).to have_content cbf.title
    expect(page).to have_content cbf.headline
    expect(page).to have_content strip_tags cbf.company_introductions
    expect(page).to have_content cbf.founded_on_year
    expect(page).to have_content cbf.ownership_structure
    expect(page).to have_content(cbf.category.name)
    expect(page).to have_content(cbf.industry.name)
    expect(page).to have_content cbf.address_1
    expect(page).to have_content cbf.address_2
    expect(page).to have_content cbf.city
    expect(page).to have_content cbf.state
    expect(page).to have_content cbf.zip
    expect(page).to have_content cbf.phone
    expect(page).to have_content cbf.photo_url
    # expect(page).to have_content cbf.video_url

    expect(page).to have_content strip_tags cbf.summary
  end

  it "by editing one" do
    visit edit_company_basic_form_path FactoryGirl.create(:company_basic_form)
    fill_in_company_basic_form
    expect(page).to have_content('Company demographic info saved.')
  end

  it "by successfully submitting for review" do
    create_new_company_basic_form
    (expect page.find_by_id "status").to have_content 'Draft'
    click_link 'Submit for review'
    (expect page.find_by_id "status").to have_content 'Ready for review'
  end

  it "by unsuccessfully submitting for review" do
    create_blank_new_company_basic_form
    (expect page.find_by_id "status").to have_content 'Draft'
    click_link 'Submit for review'
    (expect page).to have_content 'errors encountered'
  end
end