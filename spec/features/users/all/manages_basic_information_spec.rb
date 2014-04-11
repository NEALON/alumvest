require 'spec_helper'

describe 'users manages basic information', :type => :feature do

  it 'updates' do
    sign_up :investor
    click_on 'User Information'
    click_on 'Edit'
    fill_in_user_basic_info
    expect(page).to have_content 'info saved'
  end
end
