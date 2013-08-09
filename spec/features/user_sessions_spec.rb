require File.dirname(__FILE__) + '/../spec_helper'

describe "user sessions", :type => :feature do

  before :each do
    visit "/"
    page.driver.browser.manage.window.resize_to(1600,1000)
  end

  it "registers" do
    sign_up
    expect(page).to have_content('Signed in!')
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
    expect(page).to have_content('Signed in!')
  end
end