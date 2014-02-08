require 'active_support/concern'

module Docusign::Envelope::DocusignCalls
  extend ActiveSupport::Concern

  included do
    def get_recipient_view(for_role)
      client = DocusignRest::Client.new
      view = client.get_recipient_view(
          {
              :envelope_id => envelope_id,
              :name => 'Mike Pence',
              :email => "mike.pence+#{for_role}@gmail.com",
              :return_url => root_url + "envelopes/#{envelope_id}/record_event"
          }
      )
    end

    def post_new_status(status)
      # For now, just pass it up the hierarchy. In the near future, we will do some more info to validate the status retrieval
      signing.post_new_status(status)
    end
  end
end