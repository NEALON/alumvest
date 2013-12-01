require File.dirname(__FILE__) + '/../../spec_helper'

describe "users demograpic info", :type => :feature do

  before :each do
    sign_up :investor
    click_on 'Demographic Info'
  end

  it "shows" do
    expect(page).to have_content 'Mobile Phone'
    expect(page).to have_content 'Home Phone'
    expect(page).to have_content 'Address 1'
    expect(page).to have_content 'Address 2'
    expect(page).to have_content 'City'
    expect(page).to have_content 'State'
    expect(page).to have_content 'Zip'
    expect(page).to have_content 'Personal Statement'
  end

  it "updates" do
    expect(page).to have_button 'Edit'
    click_on 'Edit'
    fill_in 'demographic_mobile_phone', :with => '12345'
    click_on 'Save'
    expect(page).to have_content 'info saved'
    expect(page).to have_content '12345'
  end
end
