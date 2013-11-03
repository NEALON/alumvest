class EnvelopeEvent < ActiveRecord::Base
  attr_accessible :envelope, :envelope_id, :status, :status_date_time

  belongs_to :envelope

  after_create :notify_envelope

  def notify_envelope
    envelope.post_new_status(status)
  end
end
