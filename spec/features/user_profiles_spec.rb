require File.dirname(__FILE__) + '/../spec_helper'

describe "user profiles", :type => :feature do

  it "owner user profile" do
    sign_up :owner
    click_link 'Edit Profile'

    page.should_not have_content 'Investor Profile'

    # Basic Info
    first_name = Faker::Name.first_name
    middle_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    fill_in_user_basic_info(first_name, middle_name, last_name)

    expect(page).to have_content('User info saved.')
    expect(page).to have_content(first_name)
    expect(page).to have_content(middle_name)
    expect(page).to have_content(last_name)

    # Advanced Info
    click_link 'Edit Profile'
    click_link 'Advanced Info'

    mobile_phone = Faker::PhoneNumber.cell_phone
    home_phone = Faker::PhoneNumber.phone_number
    address1 = Faker::Address.street_address
    city = Faker::Address.city
    state = Faker::Address.state
    zip_code = Faker::Address.zip_code
    ps = Faker::Lorem.sentence(10)
    fill_in_user_advanced_info(mobile_phone, home_phone, address1, city, state, zip_code, ps)

    expect(page).to have_content('User info saved.')
    expect(page).to have_content(mobile_phone)
    expect(page).to have_content(home_phone)
    expect(page).to have_content(address1)
    expect(page).to have_content(city)
    expect(page).to have_content(state)
    expect(page).to have_content(zip_code)
    expect(page).to have_content(ps)

    # Founder Profile
    # click_link 'Edit Profile'
    # click_link 'Founder Profile'
    # fill_in_user_owner_profile

    # expect(page).to have_content('User info saved.')
    # expect(page).to have_content('Married')
    # expect(page).to have_content('000-00-0000')
  end

  it "investor user profile" do
    sign_up :investor
    click_link 'Edit Profile'

    page.should_not have_content 'Founder Profile'

    # Investor Profile
    click_link 'Investor Profile'
    fill_in_user_investor_profile

    expect(page).to have_content('Investor info saved.')
    expect(page).to have_content('Married')
  end

  it "changes password" do
    sign_up :owner
    click_link 'Edit Profile'
    within("#sidebar"){click_link 'Settings'}

    fill_in 'user_password', :with => '123456'
    fill_in 'user_password_confirmation', :with => '123'
    click_button 'Save'

    expect(page).to have_content('Password info failed to update.')

    fill_in 'user_password', :with => '123456'
    fill_in 'user_password_confirmation', :with => '123456'
    click_button 'Save'

    expect(page).to have_content('Password info saved.')
    signout
    sign_in @email, '123456'
    expect(page).to have_link('Sign out')
  end
end
