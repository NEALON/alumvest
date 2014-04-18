module Docusign::EnvelopeEvent
  class Base < ActiveRecord::Base

    attr_accessible :envelope, :envelope_id, :status, :status_date_time

    self.table_name = :envelope_events

    belongs_to :envelope, :class_name => 'Docusign::Envelope::Base'

    after_create :notify_envelope

    def notify_envelope
      envelope.post_new_status(status)
    end
  end
end

