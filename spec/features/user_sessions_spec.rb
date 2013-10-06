require File.dirname(__FILE__) + '/../spec_helper'

describe "user sessions", :type => :feature do

  it "registers email owner" do
    sign_up :owner
    expect(page).to have_content('Please complete your profile.')
    expect(page).to have_link('Edit Profile')
    expect(page).to have_link('Sign out')
  end

  it "registers email investor" do
    sign_up :investor
    expect(page).to have_content('Please complete your profile.')
    expect(page).to have_link('Edit Profile')
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

  it "registers fb owner" do
    set_omniauth

    visit '/'
    click_link 'Register'
    click_link 'Facebook'

    expect(page).to have_link "Edit Profile"
    expect(page).to have_link "Sign out"

    click_button "I am an Investor"
    expect(page).to have_link "Investor"
    signout

    click_link 'Login'
    within '#login-modal' do
      click_link 'Facebook'
    end
    expect(page).to have_link "Investor"
    expect(page).to have_link "Sign out"

    unset_omniauth
  end

  it "sends out welcome email after sign up" do
    sign_up :owner
    mail = ActionMailer::Base.deliveries.last
    mail.subject.should == 'Welcome to AlumVest'
    mail.to.should == [@email]
    mail.from.should == ['info@alumvest.com']
    mail.body.encoded.should match(@first_name)
    mail.body.encoded.should match(@last_name)
    mail.body.encoded.should match("http://www.alumvest.com")
  end
end
