require 'active_support/concern'

module Docusign::EnvelopeDocusignCalls
  extend ActiveSupport::Concern

  included do
    def get_recipient_view(for_role)
      client = DocusignRest::Client.new
      if for_role == 'investor'
        name = signing.investment.investor.user.full_name
        email = signing.investment.investor.user.email
      end

      if for_role == 'issuer'
        name = signing.investment.campaign.issuer.user.full_name
        email = signing.investment.campaign.issuer.user.email
      end
      view = client.get_recipient_view(
          {
              :envelope_id => envelope_id,
              :name => name,
              :email => email,
              :return_url => root_url + "envelopes/#{envelope_id}/record_event"
          }
      )
    end

    def post_new_status(status)
      signing.post_new_status(status)
    end
  end
end