require File.dirname(__FILE__) + '/../spec_helper'

describe "user sessions", :type => :feature do

  it "registers email owner" do
    sign_up :owner
    expect(page).to have_content('Please complete your profile.')
    expect(page).to have_link('edit')
    expect(page).to have_link('Sign out')
  end

  it "registers email investor" do
    sign_up :investor
    expect(page).to have_content('Please complete your profile.')
    expect(page).to have_link('edit')
    expect(page).to have_link('Sign out')
  end

  it "signs out" do
    sign_up
    signout
    expect(page).to have_content('Signed out!')
  end

  it "signs back in" do
    sign_up
    signout
    sign_in
    expect(page).to have_link('Sign out')
  end

  it "register fb owner" do
    set_omniauth()
    visit '/'
    click_link 'Register'
    click_link 'Sign up via Facebook'

    expect(page).to have_link "edit"
    expect(page).to have_link "Sign out"

    click_button "I am an Investor"
    expect(page).to have_link "Investor"

    signout

    click_link 'Login'
    click_link 'Login via Facebook'
    expect(page).to have_link "Investor"
    expect(page).to have_link "Sign out"
  end
end
