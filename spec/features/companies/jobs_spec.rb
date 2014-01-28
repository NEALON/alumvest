require 'spec_helper'

describe 'managing company jobs', :type => :feature do

  before :each do
    sign_up :issuer
    @category = FactoryGirl.create(:category)
    @campaign = FactoryGirl.create(:campaign, :issuer => @issuer)
    @company = FactoryGirl.create(:company, :campaign => @campaign)
  end

  it 'by creating one' do
    create_new_job(@company)
    expect(page).to have_content('Company job saved.')
  end

  it 'by editing one' do
    job = FactoryGirl.create(:job, :company => @company)
    visit edit_campaign_company_job_path(@campaign, job)
    fill_in_job @company
    expect(page).to have_content('Company job saved.')
  end

  it 'by deleting one' do
    create_new_job(@company)
    visit campaign_company_jobs_path(@campaign)
    click_link '[Delete]'
    expect(page).to have_content('Your job was deleted.')
  end
end
