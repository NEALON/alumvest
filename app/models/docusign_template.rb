class DocusignTemplate < ActiveRecord::Base
  attr_accessible :template_id

  has_many :docusign_envelopes
  belongs_to :document

  def create_envelope(signing, investor)
    client = DocusignRest::Client.new

    envelope = client.create_envelope_from_template(
        {
            :template_id => template_id,
            :status => 'sent',
            :email => {
                :subject => 'subject',
                :body => 'body'},
            :signers => [
                {
                    :embedded => true,
                    :name => investor[:name],
                    :email => investor[:email],
                    :role_name => 'investor'
                }
            ]
        })

    if envelope['status'] && envelope['status'] == 'sent'
      docusign_envelopes << dse = DocusignEnvelope.new(
          :signing => signing,
          :envelope_id => envelope['envelopeId'],
          :uri => envelope['uri'])
      dse.events << dse_event = DocusignEnvelopeEvent.create(
          :status => envelope['status'],
          :status_date_time => envelope['statusDateTime'])
      dse
    else
      # TODO: some logging of the error
      nil
    end
  end
end
