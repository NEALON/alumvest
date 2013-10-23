class DocusignEnvelopeEvent < ActiveRecord::Base
  attr_accessible :envelope_id, :status, :status_date_time

  belongs_to :docusign_envelope
end
