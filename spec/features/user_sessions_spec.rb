require File.dirname(__FILE__) + '/../spec_helper'

describe "user sessions", :type => :feature do

  it "registers owner" do
    sign_up :owner
    expect(page).to have_content('Please complete your profile.')
    expect(page).to have_link('edit')
    expect(page).to have_link('Sign out')
    expect(page).to have_content('Owner Information')
  end

  it "registers investor" do
    sign_up :investor
    expect(page).to have_content('Please complete your profile.')
    expect(page).to have_link('edit')
    expect(page).to have_link('Sign out')
    expect(page).to have_content('Investor Information')
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
end
