require 'spec_helper_without_capybara'

describe TalksToVeritax do

  before :each do
    @client = subject.client
  end

  it 'parses the WSDL' do
    expect(@client).to_not be_nil
    expect(@client.operations.include?(:get_order_info)).to be_true
  end

  it 'creates an esigned order' do
    response = subject.create_esigned_order
    # expect(response).to indicate success
    # expect(response).to include an order id
    # failure case + success case?
    # maybe make some contexts for that
  end

  it 'gets order info' do
    subject.create_esigned_order
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