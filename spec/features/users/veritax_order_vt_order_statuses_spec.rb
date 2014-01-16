require File.dirname(__FILE__) + '/../../spec_helper'

describe 'users investor income verification veritax order statuses', :type => :feature do

  # duplicated in talks_to_veritax_spec
  ReceivedOrderId = '2987596'
  CompletedOrderId = '2987595'
  CanceledOrderId = '2987602'

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
    before :each do
      @attrs = {id: rand(1000000),
               ssn: Faker::Ssn.en_ssn,
               first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               address: Faker::Address.street_address,
               city: Faker::Address.city,
               state: Faker::Address.state_abbr,
               zip_code: '18901',
               previous_address: Faker::Address.street_address,
               previous_city: Faker::Address.city,
               previous_state: Faker::Address.state_abbr,
               previous_zip: '18901',
               email: Faker::Internet.email}
    end

    it 'gets Received status' do
      vo = FactoryGirl.create(:veritax_order, @attrs.merge(:vt_order_id => ReceivedOrderId))
      vo.get_order_info!
      expect(vo.vt_status).to eq('Received')
    end

    it 'gets Completed status' do
      vo = FactoryGirl.create(:veritax_order, @attrs.merge(:vt_order_id => CompletedOrderId))
      vo.get_order_info!
      expect(vo.vt_status).to eq('Completed')
    end

    it 'gets Cancled status' do
      vo = FactoryGirl.create(:veritax_order, @attrs.merge(:vt_order_id => CanceledOrderId))
      vo.get_order_info!
      expect(vo.vt_status).to eq('Canceled')
    end
  end
end