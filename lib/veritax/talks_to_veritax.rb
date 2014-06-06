require 'savon'

class Veritax::TalksToVeritax

  attr_reader :client

  CERT_ENDPOINT = 'https://cert.secure.veri-tax.com/vt.service/PublicAPI/vtservice.asmx'.freeze
  PRODUCTION_ENDPOINT = 'https://secure.veri-tax.com/vt.service/PublicAPI/vtservice.asmx'.freeze

  if Rails.env.production?
    ENDPOINT_IN_USE = PRODUCTION_ENDPOINT
    LOGIN = 'AlumVest'
    PASSWORD = 'Awesometeam!'
  else
    ENDPOINT_IN_USE = CERT_ENDPOINT
    LOGIN = 'AlumVest_WS'
    PASSWORD = 'xGEaFe.w'
  end

  WSDL = ENDPOINT_IN_USE + '?wsdl'

  Type4506 = 'F1040PlusWages'
  TranscriptType = 'A'
  ESignOption = 'Option1' # send an e-signable 4506 to customer
  Years = {:int => 2012, :int => 2011}

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
                     years: Years,
                     e_sign_option: ESignOption,
                     'EmailAddress1' => order.email
                 })
  end

  def get_order_info(order_id)
    @client.call(:get_order_info,
                 message: {
                     login: LOGIN,
                     password: PASSWORD,
                     order_id: order_id
                 })
  end

  def get_transcript(order_id)
    @client.call(:get_transcript,
                 message: {
                     login: LOGIN,
                     password: PASSWORD,
                     order_id: order_id,
                     type: Type4506})
  end
end