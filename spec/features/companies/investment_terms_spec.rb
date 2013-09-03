require File.dirname(__FILE__) + '/../../spec_helper'

describe "managing company investment terms", :type => :feature do

  before :each do
    sign_up :owner
    @company = Company.last
  end

  it "by creating one" do
    create_new_investment_term(@company)
    expect(page).to have_content('Company investment terms saved.')
  end
  
  it "by editing one" do
    FactoryGirl.create(:investment_term, :company => @company)
    visit edit_company_investment_term_path(@company)
    fill_in_investment_term @company
    expect(page).to have_content('Company investment terms saved.')
  end
  
  #it "by successfully submitting for review" do
  #  create_new_investment_term(@company)
  #  (expect page.find_by_id "status").to have_content 'Draft'
  #  click_link 'Submit for review'
  #  (expect page.find_by_id "status").to have_content 'Ready for review'
  #end

  #it "by unsuccessfully submitting for review" do
  #  create_blank_new_investment_term(@company)
  #  (expect page.find_by_id "status").to have_content 'Draft'
  #  click_link 'Submit for review'
  #  (expect page).to have_content 'errors encountered'
  #end
end