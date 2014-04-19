require 'spec_helper'

describe 'non-accredited investor income verification results', :type => :feature do

  context 'completed' do
    before :each do
      @admin_user = create_admin
      @investor = create_non_accredited_investor.investor
      @vt_order = FactoryGirl.create(
          :veritax_order,
          :investor => @investor,
          :vt_order_id => CompletedOrderId,
          :status => 'submitted')
      Veritax::OrderBase.update_order_statuses!
    end

    it 'displays completed orders to the admin' do
      sign_in 'admin@alumvest.com', 'secret'
      click_on 'Income Verification Events'
      expect(page).to have_content('An income verification order was successfully completed')
    end

    it 'displays completed orders to the investor' do
      sign_in 'investor@alumvest.com', 'secret'
      visit user_investor_events_path(@investor.user)
      expect(page).to have_content('Your income verification request was marked as completed')
    end

    context 'approved' do
      it 'should' do
        sign_in 'admin@alumvest.com', 'secret'
        visit income_verification_events_user_admin_path(@admin_user)
        click_on 'Approve'
        sign_out
        sign_in 'investor@alumvest.com', 'secret'
        visit user_investor_events_path(@investor.user)
        expect(page).to have_content('Your income verification request was approved')
      end
    end

    context 'rejected' do
      it 'should' do
        sign_in 'admin@alumvest.com', 'secret'
        visit income_verification_events_user_admin_path(@admin_user)
        click_on 'Reject'
        sign_out
        sign_in 'investor@alumvest.com', 'secret'
        visit user_investor_events_path(@investor.user)
        expect(page).to have_content('Your income verification request was rejected')
      end
    end
  end

  context 'canceled' do
    before :each do
      create_admin
      @investor = create_non_accredited_investor.investor
      @vt_order = FactoryGirl.create(
          :veritax_order,
          :investor => @investor,
          :vt_order_id => CanceledOrderId,
          :status => 'submitted')
      Veritax::OrderBase.update_order_statuses!
    end

    it 'displays completed orders to the admin' do
      sign_in 'admin@alumvest.com', 'secret'
      click_on 'Income Verification Events'
      expect(page).to have_content('An income verification order was canceled')
    end

    it 'displays completed orders to the investor' do
      sign_in 'investor@alumvest.com', 'secret'
      visit user_investor_events_path(@investor.user)
      expect(page).to have_content('Your income verification request was marked as canceled')
    end
  end

end