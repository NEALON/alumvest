require 'spec_helper'

describe 'users investor income verification', :type => :feature do

  context 'viewing submitted veritax orders' do

    before :each do

      sign_up :investor
      click_on 'Investor Dashboard'
      click_on 'Income Verification'
      fill_in_income_verification
      click_on 'Submit to Veri-Tax'
      sign_out
      @the_investor = @investor

      admin_user = create_admin
      sign_in 'admin@alumvest.com', 'secret'
      visit income_verification_events_user_admin_path(admin_user)
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
      expect(page).to have_content('An income verification order was canceled')
    end
  end

  context 'viewing completed veritax orders' do

    before :each do
      investor_user = create_self_accredited_investor
      admin_user = create_admin
      order = FactoryGirl.create(:veritax_order,
                                 :investor => investor_user.investor,
                                 :status => 'completed',
                                 :vt_order_id => CompletedOrderId)
      FactoryGirl.create(:veritax_order_completed,
                         :veritax_order => order,
                         :investor => investor_user.investor)
      sign_in 'admin@alumvest.com', 'secret'
      visit income_verification_events_user_admin_path(admin_user)
    end

    it 'lists' do
      expect(page).to have_content('An income verification order was successfully completed')
    end

    it 'approves' do
      click_on 'Approve'
      expect(page).to have_content('Accredited investor income approved.')
    end

    it 'rejects' do
      click_on 'Reject'
      expect(page).to have_content('Accredited investor income rejected.')
    end
  end
end