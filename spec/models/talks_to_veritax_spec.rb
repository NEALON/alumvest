require 'spec_helper_without_capybara'

describe TalksToVeritax do

  before :each do
    @client = subject.client
    @order = double(
        id: rand(1000000),
        ssn: Faker::Ssn.en_ssn,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        address: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state_abbr,
        zip_code: Faker::Address.zip,
        previous_address: Faker::Address.street_address,
        previous_city: Faker::Address.city,
        previous_state: Faker::Address.state_abbr,
        previous_zip: Faker::Address.zip,
        email: Faker::Internet.email)
  end

  it 'parses the WSDL' do
    expect(@client).to_not be_nil
    expect(@client.operations.include?(:get_order_info)).to be_true
  end

  it 'creates an e-signed order' do
    response = subject.create_esign4506_order(@order)
    expect(response.success?).to be_true
    raise response.body.inspect

    #body[:create_esigned_order_response][:create_esigned_order_result].has_key?(:error_code) or something with is_a? Hash
    #body[:create_esigned_order_response][:create_esigned_order_result][:order_id] > 0
    #
    #{:create_esigned_order_response =>
    #     {:create_esigned_order_result =>
    #          {:error_code => "AuthenticationFailed",
    #           :error_message => "Username/Password not found",
    #           :order_id=>"0"}}

    # expect(response).to include an order id
    # failure case + success case?
    # maybe make some contexts for that
  end

  it 'gets order info' do
    subject.create_esigned_order({})
    # expect(response).to include status information
    # failure case + success case?
    # maybe make some contexts for that
  end

  it 'gets transcript' do
    # expect(response).to include transcript data
    # failure case + success case?
    # maybe make some contexts for that
  end
end