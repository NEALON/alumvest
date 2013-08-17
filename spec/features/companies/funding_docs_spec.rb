require File.dirname(__FILE__) + '/../../spec_helper'

describe "managing company funding docs", :type => :feature do

  before :each do
    sign_up :owner
  end

  it "by creating one" do
    visit new_company_funding_doc_form_path
    fill_in_company_funding_doc_form
    expect(page).to have_content('Company funding doc info saved.')
  end
  
  it "by editing one" do
    visit edit_company_funding_doc_form_path FactoryGirl.create(:company_funding_doc_form)
    fill_in_company_funding_doc_form
    expect(page).to have_content('Company funding doc info saved.')
  end  
end