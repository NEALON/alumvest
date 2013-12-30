require 'savon'

class TalksToVeritax

  attr_reader :client

  WSDL = 'https://secure.veri-tax.com/vt.service/PublicAPI/VT4506/VT4506.asmx?WSDL'
  TEST_ENDPOINT = 'https://wstest.veri-tax.com/vt.service/PublicAPI/VT4506/VT4506.asmx'
  CERTIFICATION_ENDPOINT = 'https://cert.secure.veri-tax.com/vt.service/PublicAPI/vtservice.asmx'
  PRODUCTION_ENDPOINT = 'https://secure.veri-tax.com/vt.service/PublicAPI/VT4506/VT4506.asmx'

  # TODO: read these from the environment
  LOGIN = 'sablovatskiy'
  PASSWORD = 'alumvest2014'

  Type4506 = 'F1040PlusWages'
  ESignOption = 'Option1' # send an e-signable 4506 to customer
  
  def initialize
    @client = Savon.client(wsdl: WSDL, endpoint: TEST_ENDPOINT)
  end

  def create_esigned_order(order)
    @client.call(:create_esigned_order,
                 message: {
                     login: LOGIN,
                     password: PASSWORD,
                     type: Type4506,
                     loanNumber: order.id,
                     'SSN' => '111-11-1111',
                     first_name: 'Mike',
                     last_name: '',
                     address: '',
                     city: '',
                     state: '',
                     zip_code: '',
                     previous_address: '',
                     previous_city: '',
                     previous_state: '',
                     previous_zip: '',
                     e_sign_option: ESignOption,
                     'EmailAddress1' => ''
                 })
    # responds with a boolean for success
    # returns an order id
  end

  def get_order_info(order_id)
    @client.call(:get_order_info,
                 message: {
                     login: LOGIN,
                     password: PASSWORD,
                     order_id: order_id
                 })
    # evaluate result and return stuff...
  end

  # where do we get order_id from? after posting...

  def get_transcript
    @client.call(:get_transcript,
                 message: {
                     login: LOGIN,
                     password: PASSWORD
                 })
    # evaluate result and return stuff...
  end
end