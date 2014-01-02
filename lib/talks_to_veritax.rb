require 'savon'

class TalksToVeritax

  attr_reader :client

  BETA_ENDPOINT = 'https://wstest.veri-tax.com/vt.service/PublicAPI/VT4506/VT4506.asmx'
  CERT_ENDPOINT = 'https://cert.secure.veri-tax.com/vt.service/PublicAPI/vtservice.asmx'
  PRODUCTION_ENDPOINT = 'https://secure.veri-tax.com/vt.service/PublicAPI/VT4506/VT4506.asmx'

  ENDPOINT_IN_USE = CERT_ENDPOINT
  WSDL = ENDPOINT_IN_USE + '?wsdl'

  # TODO: read these from the environment
  LOGIN = 'AlumVest_WS'
  PASSWORD = 'xGEaFe.w'

  Type4506 = 'F1040PlusWages'
  TranscriptType = 'A'
  ESignOption = 'Option1' # send an e-signable 4506 to customer
  
  def initialize
    @client = Savon.client(wsdl: WSDL, endpoint: ENDPOINT_IN_USE)
  end

  def operations
    @client.operations
  end

  def create_esign4506_order(order)
    @client.call(:create_esign4506_order,
                 message: {
                     login: LOGIN,
                     password: PASSWORD,
                     type: Type4506,
                     loanNumber: order.id,
                     'TranscriptType' => TranscriptType,
                     'SSN' => order.ssn,
                     first_name: order.first_name,
                     last_name: order.last_name,
                     address: order.address,
                     city: order.city,
                     state: order.state,
                     zip_code: order.zip_code,
                     previous_address: order.previous_address,
                     previous_city: order.previous_city,
                     previous_state: order.previous_state,
                     previous_zip: order.previous_zip,
                     e_sign_option: ESignOption,
                     'EmailAddress1' => order.email
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