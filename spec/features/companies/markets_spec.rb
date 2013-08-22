require File.dirname(__FILE__) + '/../../spec_helper'

describe "managing company markets", :type => :feature do

  before :each do
    sign_up :owner
  end
  
  it "by creating one" do
    create_new_company_market_form
    expect(page).to have_content('Company market info saved.')
  end
  
  it "by editing one" do
    visit edit_company_market_form_path FactoryGirl.create(:company_market_form)
    fill_in_company_market_form
    expect(page).to have_content('Company market info saved.')
  end
  
  it "by successfully submitting for review" do
    create_new_company_market_form
    (expect page.find_by_id "status").to have_content 'Draft'
    click_link 'Submit for review'
    (expect page.find_by_id "status").to have_content 'Ready for review'
  end

  it "by unsuccessfully submitting for review" do
    create_blank_new_company_market_form
    (expect page.find_by_id "status").to have_content 'Draft'
    click_link 'Submit for review'
    (expect page).to have_content 'errors encountered'
  end    
end