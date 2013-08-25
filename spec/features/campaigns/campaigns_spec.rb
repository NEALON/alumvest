require File.dirname(__FILE__) + '/../../spec_helper'

describe "managing campaigns", :type => :feature do

  before :each do
    @industry = FactoryGirl.create(:industry)
    @category = FactoryGirl.create(:category)
    sign_up :owner
  end

  it "by creating a new one" do
    create_new_company
    click_link 'New campaign'
    fill_in_campaign
    expect(page).to have_content('Campaign info saved.')
  end

  it "by editing one" do
    # visit new_company_path
    # click_link 'New campaign'
    # fill_in_campaign
    # click_link 'Edit'
    # fill_in_company
    # expect(page).to have_content('Campaign info saved.')
  end

  it "by displaying one" do
    # raise FactoryGirl.create(:company).inspect
    # @company_worksheet = FactoryGirl.create(:company_worksheet, :owner => @owner)
    # raise @company_worksheet.inspect
  end
end