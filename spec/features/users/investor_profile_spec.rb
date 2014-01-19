require 'spec_helper'
describe 'users investor profile', :type => :feature do

  before :each do
    sign_up :investor
    click_on 'Investor Dashboard'
    click_on 'Investor Profile'
  end

  it 'shows' do
    expect(page).to have_content 'SSN'
    expect(page).to have_content 'Marital Status'
    expect(page).to have_content 'Financial Info'
    expect(page).to have_content 'Spending Habits'
    expect(page).to have_content 'Income'
    expect(page).to have_content 'Income Type'
    expect(page).to have_content 'Net Worth'
    expect(page).to have_content 'Investor Representations'
    expect(page).to have_content 'Company'
    expect(page).to have_content 'Job Title'
    expect(page).to have_content 'Experience'
    expect(page).to have_content 'Expertise'
    expect(page).to have_content 'Personal Message'
  end

  it 'updates' do
    expect(page).to have_button 'Edit'
    click_on 'Edit'
    fill_in 'investor_ssn', :with => '123-45-6789'
    click_on 'Save'
    expect(page).to have_content 'info saved'
    expect(page).to have_content '123-45-6789'
  end
end
