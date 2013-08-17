require File.dirname(__FILE__) + '/../../spec_helper'

describe "managing company basics", :type => :feature do

  before :each do
    @industry = FactoryGirl.create(:industry)
    @category = FactoryGirl.create(:category)
    sign_up :owner
  end

  it "by creating one" do
    create_new_company_basic_form
    expect(page).to have_content('Company demographic info saved.')
  end

  it "by editing one" do
    visit edit_company_basic_form_path FactoryGirl.create(:company_basic_form)
    fill_in_company_basic_form
    expect(page).to have_content('Company demographic info saved.')
  end
end