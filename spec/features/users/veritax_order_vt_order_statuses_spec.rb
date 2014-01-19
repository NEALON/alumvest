require 'spec_helper'

describe 'users investor income verification veritax order statuses', :type => :feature do

  context 'a new order' do
    before :each do
      sign_up :investor
      click_on 'Investor Dashboard'
      click_on 'Income Verification'
    end

    it 'gets NotReceived' do
      fill_in_income_verification
      expect(page).to have_content 'Your information was saved.'
      click_on 'Submit to Veri-Tax'
      expect(page).to have_content 'Your information was successfully submitted to Veri-Tax'
      vo = Veritax::Order.last
      vo.get_order_info!
      expect(vo.vt_status).to eq('NotReceived')
    end
  end

  context 'an existing order' do

    it 'gets Received status' do
      vo = FactoryGirl.create(:veritax_order, :vt_order_id => ReceivedOrderId)
      vo.get_order_info!
      expect(vo.vt_status).to eq('Received')
    end

    it 'gets Completed status' do
      vo = FactoryGirl.create(:veritax_order, :vt_order_id => CompletedOrderId)
      vo.get_order_info!
      expect(vo.vt_status).to eq('Completed')
    end

    it 'gets Cancled status' do
      vo = FactoryGirl.create(:veritax_order, :vt_order_id => CanceledOrderId)
      vo.get_order_info!
      expect(vo.vt_status).to eq('Canceled')
    end

    it 'gets a transcript for a Completed order' do
      vo = FactoryGirl.create(:veritax_order, :vt_order_id => CompletedOrderId)
      result = vo.get_transcript!
      expect(result.blank?).to eq(false)
    end
  end
end