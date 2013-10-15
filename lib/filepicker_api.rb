require 'rest_client'
require 'json'

class FilepickerApi
  API_ENDPOINT = 'https://www.filepicker.io/api'
  API_KEY = 'Ag9xlSqkGT63t76SagTVsz'

  def self.store(file)
    url = API_ENDPOINT + '/store/S3?key=' + API_KEY
    response = RestClient.post url, :fileUpload => file
    JSON.parse(response)
  end
end
