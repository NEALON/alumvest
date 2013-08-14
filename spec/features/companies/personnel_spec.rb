require File.dirname(__FILE__) + '/../../spec_helper'

describe "company personnel management", :type => :feature do

  before :each do
    sign_up :owner
  end

  it "creates" do
    visit new_company_personnel_form_path
    fill_in_company_personnel_form
    expect(page).to have_content('Company people info saved.')
    sleep 10
  end

  it "edits" do
    visit new_company_personnel_form_path
    fill_in_company_personnel_form
    click_link 'Edit'
    fill_in_company_personnel_form
    expect(page).to have_content('Company people info saved.')
  end
end