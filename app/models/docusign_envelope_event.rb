class DocusignEnvelopeEvent < ActiveRecord::Base
  attr_accessible :docusign_envelope, :envelope_id, :status, :status_date_time

  belongs_to :docusign_envelope

  after_create :update_signing_status

  def update_signing_status
    case status
      when 'signing_complete'
        docusign_envelope.signing.sign!
      when 'cancel'
        docusign_envelope.signing.cancel!
      when 'decline'
        docusign_envelope.signing.decline!
    end
  end
end
