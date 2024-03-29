require 'spec_helper'

describe 'non-accredited investor manages income verification', :type => :feature do

  before :each do
    sign_up :investor
    click_on 'Investor Dashboard'
    click_on 'Income Verification'
  end

  it 'copies existing field values' do
    expect(page.find_field('veritax_order_base_ssn').value).to eq(@user.ssn || '')
    expect(page.find_field('veritax_order_base_first_name').value).to eq(@user.first_name)
    expect(page.find_field('veritax_order_base_last_name').value).to eq(@user.last_name || '')
    expect(page.find_field('veritax_order_base_address').value).to eq(@user.address || '')
    expect(page.find_field('veritax_order_base_city').value).to eq(@user.city || '')
    expect(page.find_field('veritax_order_base_state').value).to eq(@user.state || '')
    expect(page.find_field('veritax_order_base_zip_code').value).to eq(@user.zipcode || '')
    expect(page.find_field('veritax_order_base_email').value).to eq(@user.email || '')
  end

  it 'creates' do
    fill_in_income_verification
    expect(page).to have_content 'Your information was saved.'
  end

  it 'updates' do
    fill_in_income_verification
    expect(page).to have_content 'Your information was saved.'
    click_on 'Edit'
    fill_in_income_verification
    expect(page).to have_content 'Your information was saved.'
  end
  
  it 'successfully submits to veritax' do
    fill_in_income_verification
    expect(page).to have_content 'Your information was saved.'
    click_on 'Submit to Veri-Tax'
    expect(page).to have_content 'Your information was successfully submitted to Veri-Tax'
    expect(page).to have_content 'Your Investor Newsfeed'
  end

  it 'unsuccessfully submits to veritax' do
    fill_in_income_verification(666)
    click_on 'Submit to Veri-Tax'
    expect(page).to have_content 'An error was encountered'
  end

  it 'retries submission after an error' do
    fill_in_income_verification(666)
    click_on 'Submit to Veri-Tax'
    expect(page).to have_content 'An error was encountered'
    click_on 'Investor Newsfeed'
    expect(page).to have_content 'You encountered an error'
    click_on 'Income Verification'
    click_on 'Edit'
    fill_in_income_verification
    click_on 'Submit to Veri-Tax'
    expect(page).to have_content 'Your information was successfully submitted to Veri-Tax'
  end
end