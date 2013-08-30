require File.dirname(__FILE__) + '/../../spec_helper'

describe "managing company updates", :type => :feature do

  before :each do
    sign_up :owner
    @company = Company.last
  end

  it "by creating one" do
    create_new_update(@company)
    expect(page).to have_content('Company update saved.')
  end

  it "by editing one" do
    update = FactoryGirl.create(:update, :company => @company)
    visit edit_company_update_path(@company, update)
    fill_in_update @company
    expect(page).to have_content('Company update saved.')
  end

  it "by deleting one" do
    update = FactoryGirl.create(:update, :company => @company)
    visit company_updates_path(@company)
    click_button 'Delete'
    expect(page).to have_content("Your update was deleted.")
  end
end