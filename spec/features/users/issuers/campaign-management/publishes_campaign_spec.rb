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

  it 'shows in the issuer newsfeed' do
    click_on 'Publish'
    visit user_issuer_events_path(@user)
    expect(page).to have_content('You successfully published a campaign')
  end
end

