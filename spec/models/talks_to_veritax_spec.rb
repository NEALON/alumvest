require 'spec_helper_without_capybara'

describe TalksToVeritax do

  before :each do
    @client = subject.client
    @order = double(:id => 1)
  end

  it 'parses the WSDL' do
    expect(@client).to_not be_nil
    expect(@client.operations.include?(:get_order_info)).to be_true
  end

  it 'creates an esigned order' do
    response = subject.create_esigned_order(@order)
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