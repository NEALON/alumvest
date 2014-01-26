require 'spec_helper'

describe 'users investor income verification', :type => :feature do

  context 'viewing submitted veritax orders' do

    before :each do

      sign_up :investor
      click_on 'Investor Dashboard'
      click_on 'Income Verification'
      fill_in_income_verification
      click_on 'Submit to Veri-Tax'
      signout
      @the_investor = @investor

      sign_up :admin
      u = User.last
      u.update_attribute(:user_type, 'admin')
      visit user_admin_path(u)
      click_on 'Income Verification Events'
    end

    it 'sees their listing' do
      expect(page).to have_content('order was successfully submitted')
    end

    it 'simulates a completed order' do
      click_on 'Complete'
      expect(page).to have_content('An income verification order was successfully completed')
    end

    it 'simulates a canceled order' do
      click_on 'Cancel'
      screenshot_and_open_image
    end
  end

  context 'viewing completed veritax orders' do

    before :each do
      sign_up :investor
      @the_investor = @investor
      signout
      sign_up :admin
      u = User.last
      u.update_attribute(:user_type, 'admin')
      visit user_admin_path(u)

      order = FactoryGirl.create(:veritax_order,
                                 :investor => @the_investor,
                                 :status => 'completed',
                                 :vt_order_id => CompletedOrderId)
      FactoryGirl.create(:veritax_order_completed,
                         :veritax_order => order,
                         :investor => @the_investor)
    end

    it 'sees their listing' do
      click_on 'Income Verification Events'
      screenshot_and_open_image
    end
  end
end