require 'spec_helper'

describe 'admin reviews published campaigns', :type => :feature do

  before :each do
    create_issuer
    create_live_campaign(@user.issuer)

    sign_up :admin
    u = Alumvest::User::Base.last
    u.update_attribute(:user_type, 'admin')
    visit user_admin_path(u)
  end

  it 'sees their listing' do
    click_on 'Campaign Publication Events'

    #log in as issuer and push the publish button

    expect(page).to have_content('order was successfully submitted')
  end

  #it 'simulates a completed order' do
  #  click_on 'Complete'
  #  expect(page).to have_content('An income verification order was successfully completed')
  #end
  #
  #it 'simulates a canceled order' do
  #  click_on 'Cancel'
  #  expect(page).to have_content('An income verification order was canceled')
  #end
end