require File.dirname(__FILE__) + '/../spec_helper'

describe "company funding docs management", :type => :feature do

  it "creates" do
    visit new_company_funding_doc_form_path

    'company_funding_doc_form'.tap do |form|
      fill_in "#{form}_business_plan_url", :with => Faker::Internet.url
      fill_in "#{form}_tbd_financial_document_url", :with => Faker::Internet.url
      fill_in "#{form}_tbd_funding_document_url", :with => Faker::Internet.url
      fill_in "#{form}_tbd_detailed_metrics_document_url", :with => Faker::Internet.url
      fill_in "#{form}_recent_investors", :with => Faker::Lorem.sentence(6)
      fill_in "#{form}_roadmap", :with => Faker::Lorem.sentence(6)
      fill_in "#{form}_shareholder_message", :with => Faker::Lorem.sentence(6)
    end

    click_button "Create Company funding doc form"

    expect(page).to have_content('ok')
  end
end