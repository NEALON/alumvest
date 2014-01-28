class Template < ActiveRecord::Base
  attr_accessible :template_id

  has_many :envelopes
  belongs_to :document

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
                    :role_name => 'investor'
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
      envelopes << dse = Envelope.new(
          :signing => signing,
          :envelope_id => envelope['envelopeId'],
          :uri => envelope['uri'])
      dse.events << dse_event = EnvelopeEvent.create(
          :envelope => dse,
          :status => envelope['status'],
          :status_date_time => envelope['statusDateTime'])
      dse
    else
      # TODO: some logging of the error
      raise envelope.inspect
    end
  end
end