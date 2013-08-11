require File.dirname(__FILE__) + '/../spec_helper'

describe "company personnel management", :type => :feature do

  it "creates" do
    sign_up :owner
    visit new_company_personnel_form_path
    fill_in_company_personnel_form
    expect(page).to have_content('Company people info saved.')
  end
end