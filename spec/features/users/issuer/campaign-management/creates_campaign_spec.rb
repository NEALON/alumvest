require 'spec_helper'

include ActionView::Helpers::SanitizeHelper
include ActionView::Helpers::DateHelper

describe 'issuer creates campaign', :type => :feature do

  context 'other stuff' do
    before :each do
      @category = FactoryGirl.create(:category)
      sign_up :issuer
      click_on 'Issuer Dashboard'
      click_on 'Campaign'
    end

    it 'creates the campaign' do
      click_on 'Create your campaign'
      expect(page).to have_content('New company')
    end

    it 'successfully' do
      click_on 'Create your campaign'
      @campaign = CampaignBase.first

      fill_in_company(@campaign)
      click_link 'Check for completeness'
      (expect page).to have_content 'is complete'

      create_new_team @campaign
      click_link 'Check for completeness'
      (expect page).to have_content 'is complete'

      create_new_investment_term @campaign
      click_link 'Check for completeness'
      (expect page).to have_content 'are complete'

      click_link 'Submit for review'
      (expect page).to have_content 'Your campaign is now submitted for review'
    end

    it 'by unsuccessfully submitting it' do
      #visit campaign_company_path(@campaign)
      #click_link 'Submit for review'
    end
  end
end

