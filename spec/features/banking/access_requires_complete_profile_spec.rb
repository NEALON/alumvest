require File.dirname(__FILE__) + '/../../spec_helper'

describe 'users banking access requires complete profile', :type => :feature do

  before :each do
    sign_up :investor
  end

  it 'tells the user to complete their profile prior to banking' do
    click_on 'Banking'
    expect(page).to have_content 'Complete your user profile to gain access to banking functionality.'
  end

  it 'allows access to banking functionality once their profile is completed' do
    click_on 'Banking'
    click_on 'Complete your user profile'
    fill_in_user_basic_info
    click_on 'Banking'
    expect(page).to have_content 'we need to verify your identity'
  end
end
