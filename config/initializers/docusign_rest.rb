require 'docusign_rest'

DocusignRest.configure do |config|
  config.username       = '27c58b54-c810-41b8-ad3c-7953e6728b24'
  config.password       = 'rebecca'
  config.integrator_key = 'HAYD-73356cb6-88b5-466c-b517-0ed4468c015f'
  config.account_id     = '00fea6af-872f-440a-af14-e91ec2c30427'
  config.endpoint       = 'https://demo.docusign.net/restapi' # 'https://www.docusign.net/restapi'
  #config.api_version    = 'v1'
end
