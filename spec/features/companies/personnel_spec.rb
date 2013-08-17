require File.dirname(__FILE__) + '/../../spec_helper'

describe "managing company personnel", :type => :feature do

  before :each do
    sign_up :owner
  end

  it "by creating one" do
    create_new_company_personnel_form
    expect(page).to have_content('Company people info saved.')
  end

  it "by editing one" do
    visit edit_company_personnel_form_path create_personnel_form_via_factories
    fill_in_company_personnel_form
    expect(page).to have_content('Company people info saved.')
  end
end