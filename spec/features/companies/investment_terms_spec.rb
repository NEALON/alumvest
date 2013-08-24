require File.dirname(__FILE__) + '/../../spec_helper'

describe "managing company investment terms", :type => :feature do

  before :each do
    sign_up :owner
  end

  it "by creating one" do
    create_new_investment_term
    expect(page).to have_content('Company investment terms saved.')
  end
  
  it "by editing one" do
    visit edit_investment_term_path FactoryGirl.create(:investment_term)
    fill_in_investment_term
    expect(page).to have_content('Company investment terms saved.')
  end
  
  it "by successfully submitting for review" do
    create_new_investment_term
    (expect page.find_by_id "status").to have_content 'Draft'
    click_link 'Submit for review'
    (expect page.find_by_id "status").to have_content 'Ready for review'
  end

  it "by unsuccessfully submitting for review" do
    create_blank_new_investment_term
    (expect page.find_by_id "status").to have_content 'Draft'
    click_link 'Submit for review'
    (expect page).to have_content 'errors encountered'
  end  
end