require 'spec_helper'

include ActionView::Helpers::SanitizeHelper
include ActionView::Helpers::DateHelper

describe 'issuer publishes campaign', :type => :feature do

    before :each do
      create_issuer
      create_publishable_campaign(@user.issuer)
      sign_in 'issuer@alumvest.com', 'secret'
      visit campaign_company_path(@campaign)
    end

    it 'successfully' do
      click_on 'Publish'
      expect(page).to have_content('Congratulations!')
    end

    it 'cannot subsequently edit' do
      click_on 'Publish'
      expect(page).to_not have_content('Edit Company')
      click_on 'Team'
      expect(page).to_not have_content('Edit Team')
      click_on 'Investment Terms'
      expect(page).to_not have_content('Edit Investment Terms')
    end
end

