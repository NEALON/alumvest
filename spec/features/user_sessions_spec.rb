require 'spec_helper'

describe 'user sessions', :type => :feature do

  it 'registers email issuer' do
    sign_up :issuer
    visit user_path(@issuer.user)
    expect(page).to have_link('Sign out')
  end

  it 'registers email investor' do
    sign_up :investor
    visit user_path(@investor.user)
    expect(page).to have_link('Sign out')
  end

  it 'signs out' do
    sign_up
    signout
    expect(page).to have_link('Login')
  end

  it 'signs back in' do
    sign_up
    signout
    sign_in
    expect(page).to have_link('Sign out')
  end

  #it 'registers fb issuer' do
  #  set_omniauth
  #
  #  visit '/'
  #  click_link 'Register'
  #  click_link 'Facebook'
  #  visit user_path(@issuer.user)
  #
  #  expect(page).to have_link 'Edit Profile'
  #  expect(page).to have_link 'Sign out'
  #
  #  click_button 'I am an Investor'
  #  expect(page).to have_link 'Investor'
  #  signout
  #
  #  click_link 'Login'
  #  within '#login-modal' do
  #    click_link 'Facebook'
  #  end
  #  expect(page).to have_link 'Investor'
  #  expect(page).to have_link 'Sign out'
  #
  #  unset_omniauth
  #end

  it 'sends out welcome email after sign up' do
    sign_up :issuer
    mail = ActionMailer::Base.deliveries.last
    expect(mail.subject).to eq('Welcome to AlumVest')
    expect(mail.to).to eq([@email])
    expect(mail.from).to eq(['info@alumvest.com'])
    expect(mail.body.encoded).to match(@first_name)
    expect(mail.body.encoded).to match(@last_name)
    expect(mail.body.encoded).to match('http://www.alumvest.com')
  end
end
