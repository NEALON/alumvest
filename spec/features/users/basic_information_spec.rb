require 'spec_helper'
describe 'users basic information', :type => :feature do

  before :each do
    sign_up :investor
  end

  it 'updates' do
    fill_in_user_basic_info
    expect(page).to have_content 'info saved'
  end

  it 'validates required fields' do
    click_on 'Save'
    expect(page).to have_content '6 errors encountered'
  end
end
