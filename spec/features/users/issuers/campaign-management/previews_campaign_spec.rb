require 'spec_helper'

describe 'issuer previews campaign', :type => :feature do

  before :each do
    @category = FactoryGirl.create(:category)
    sign_up :issuer
    click_on 'Issuer Dashboard'
    click_on 'Campaign'
    click_on 'Create your campaign'
    @campaign = Alumvest::CampaignBase.first
  end

  it 'previews company' do
    fill_in_company(@campaign)
    click_link 'Preview'
    (expect page).to have_content 'This is a preview'
  end

  it 'previews team' do
    create_new_team @campaign
    click_link 'Preview'
    (expect page).to have_content 'Our Team'
  end

  it 'previews investment terms' do
    create_new_investment_term @campaign
    click_link 'Preview'
    (expect page).to have_content 'Campaign Details'
  end
end

