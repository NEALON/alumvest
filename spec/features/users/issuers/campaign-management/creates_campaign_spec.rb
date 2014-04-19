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
      @campaign = Alumvest::CampaignBase.first

      fill_in_company(@campaign)
      click_link 'Check for completeness'
      (expect page).to have_content 'is complete'

      create_new_team @campaign
      click_link 'Check for completeness'
      (expect page).to have_content 'is complete'

      create_new_investment_term @campaign
      click_link 'Check for completeness'
      (expect page).to have_content 'are complete'

      click_link 'Publish'
      (expect page).to have_content 'Congratulations! Your campaign is now published and ready for our review.'
    end
  end
end

