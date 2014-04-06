require 'active_support/concern'

module Docusign::Template::DocusignCalls
  extend ActiveSupport::Concern

  included do
    def create_envelope(signing, investor)
      client = DocusignRest::Client.new

      envelope = client.create_envelope_from_template(
          {
              :template_id => template_id,
              :status => 'sent',
              :email => {
                  :subject => document.name,
                  :body => 'Please sign this document.'},
              :signers => [
                  {
                      :embedded => true,
                      :name => 'Mike Pence',
                      :email => 'mike.pence+investor@gmail.com',
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
                      :name => 'Mike Pence',
                      :email => 'mike.pence+issuer@gmail.com',
                      :role_name => 'issuer'
                  }
              ]
          })

      if envelope['status'] && envelope['status'] == 'sent'
        envelopes << dse = EnvelopeBase.new(
            :signing => signing,
            :envelope_id => envelope['envelopeId'],
            :uri => envelope['uri'])
        dse.events << dse_event = EnvelopeEventBase.create(
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
