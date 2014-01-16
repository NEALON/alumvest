require 'spec_helper_without_capybara'

describe Veritax::TalksToVeritax do

  # transient values for testing w/ VeriTax
  # duplicated in vertiax_order_vt_order_statuses_spec
  CompletedOrderId = '2987595'
  ReceivedOrderId = '2987596'
  CanceledOrderId = '2987602'

  before :each do
    @client = subject.client
    attrs = {
      id: rand(1000000),
      ssn: Faker::Ssn.en_ssn,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      address: Faker::Address.street_address,
      city: Faker::Address.city,
      state: Faker::Address.state_abbr,
      previous_address: Faker::Address.street_address,
      previous_city: Faker::Address.city,
      previous_state: Faker::Address.state_abbr,
      previous_zip: '18901',
      email: Faker::Internet.email
    }
    @order = double(attrs.merge(zip_code: '18901'))
    @bad_order = double(attrs.merge(zip_code: '666'))
    @order_for_transcript = double(attrs.merge(id: '999', zip_code: '18901'))
  end

  def create_order(order)
    response = subject.create_esign4506_order(order)
    expect(response.success?).to be_true
    result = Veritax::OrderResult.new(response.body[:create_esign4506_order_response][:create_esign4506_order_result])
  end

  it 'parses the WSDL' do
    expect(@client).to_not be_nil
    expect(@client.operations.include?(:get_order_info)).to be_true
  end

  it 'successfully creates an e-signed 4506 order' do
    result = create_order(@order)
    expect(result.success?).to be_true
  end

  it 'fails to create an e-signed 4506 order' do
    result = create_order(@bad_order)
    expect(result.success?).to be_false
    expect(result.message).to eq('Order data is invalid: Please enter a valid 5 digit Zip Code')
  end

  it 'gets order info' do
    result = create_order(@order)
    response2 = subject.get_order_info(result.order_id)
    expect(response2.success?).to be_true
    info = Veritax::OrderInfo.new(response2.body[:get_order_info_response][:get_order_info_result])
    expect(info.status).to eq('NotReceived')
    expect(info.order_completed_date).to eq(nil)
    expect(info.problem_description).to eq(nil)
  end

  it 'gets received order info' do
    response2 = subject.get_order_info(ReceivedOrderId)
    expect(response2.success?).to be_true
    info = Veritax::OrderInfo.new(response2.body[:get_order_info_response][:get_order_info_result])
    expect(info.status).to eq('Received')
    expect(info.order_completed_date).to eq(nil)
    expect(info.problem_description).not_to eq(nil)
  end

  it 'gets completed order info' do
    response2 = subject.get_order_info(CompletedOrderId)
    expect(response2.success?).to be_true
    info = Veritax::OrderInfo.new(response2.body[:get_order_info_response][:get_order_info_result])
    expect(info.status).to eq('Completed')
    #expect(info.order_completed_date).to eq(Date.new('Tue, 07 Jan 2014 10:23:16 +0000')) # TODO: fix this
    expect(info.problem_description).to eq(nil)
  end

  it 'gets canceled order info' do
    response2 = subject.get_order_info(CanceledOrderId)
    expect(response2.success?).to be_true
    info = Veritax::OrderInfo.new(response2.body[:get_order_info_response][:get_order_info_result])
    expect(info.status).to eq('Canceled')
  end

  it 'gets transcript' do
    response = subject.get_transcript(CompletedOrderId)
    expect(response.success?).to be_true
    result = Veritax::TranscriptResult.new(response.body[:get_transcript_response][:get_transcript_result])
    result.write_to_file("#{Rails.root}/temp_file.pdf")
  end

  # TODO: use getting a transcript for an in-progress order to simulate an internal error
end