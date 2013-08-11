require File.dirname(__FILE__) + '/../spec_helper'

describe "company basics management", :type => :feature do

  before :each do
    @industry = FactoryGirl.create(:industry)
    @category = FactoryGirl.create(:category)
    sign_up :owner
  end

  it "creates" do
    visit new_company_basic_form_path
    fill_in_company_basic_form
    expect(page).to have_content('Company demographic info saved.')
  end
end