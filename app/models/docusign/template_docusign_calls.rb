require 'active_support/concern'

module Docusign::TemplateDocusignCalls
  extend ActiveSupport::Concern

  included do
    def create_envelope(signing, investor)
      client = DocusignRest::Client.new

      envelope = client.create_envelope_from_template(
          {
              :template_id => docusign_template_id,
              :status => 'sent',
              :email => {
                  :subject => document.name,
                  :body => 'Please sign this document.'},
              :signers => [
                  {
                      :embedded => true,
                      :name => investor[:name],
                      :email => investor[:email],
                      :role_name => 'investor',
                      :tabs =>
                          {:number_tabs => [
                              {
                                  :label => 'investment_amount',
                                  :name => 'investment amount',
                                  :value => '999',
                                  :document_id => '1'
                              }
                          ]
                          },
                  },
                  {
                      :embedded => true,
                      :name => signing.investment.campaign.issuer.user.full_name,
                      :email => signing.investment.campaign.issuer.user.email,
                      :role_name => 'issuer'
                  }
              ]
          })

      if envelope['status'] && envelope['status'] == 'sent'
        envelopes << dse = Docusign::EnvelopeBase.new(
            :signing => signing,
            :envelope_id => envelope['envelopeId'],
            :uri => envelope['uri'])
        dse.events << dse_event = Docusign::EnvelopeEventBase.create(
            :envelope => dse,
            :status => envelope['status'],
            :status_date_time => envelope['statusDateTime'])
        dse
      else
        raise envelope.inspect
      end
    end
  end
end
