require File.dirname(__FILE__) + '/../../spec_helper'

describe "company funding docs management", :type => :feature do

  before :each do
    sign_up :owner
  end

  it "creates" do
    visit new_company_funding_doc_form_path
    fill_in_company_funding_doc_form
    expect(page).to have_content('Company funding doc info saved.')
  end
  
  it "edits" do
    visit new_company_funding_doc_form_path
    fill_in_company_funding_doc_form
    click_link 'Edit'
    fill_in_company_funding_doc_form
    expect(page).to have_content('Company funding doc info saved.')
  end  
end