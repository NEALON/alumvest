require File.dirname(__FILE__) + '/../spec_helper'

describe "owner builds company", :type => :feature do

  before :each do
    @industry = FactoryGirl.create(:industry)
    @category = FactoryGirl.create(:category)
  end

  it do
    sign_up :owner
    click_button 'Build your company profile'
    fill_in_company_basic_form
    click_link 'People'
    fill_in_company_personnel_form
    click_link 'Funding Docs'
    fill_in_company_funding_doc_form
    click_link 'Market'
    fill_in_company_market_form

    #expect(page).to have_content('ok')
  end
end