require 'active_support/concern'

module Docusign::EnvelopeEvent::Data
  extend ActiveSupport::Concern

  included do
    attr_accessible :envelope, :envelope_id, :status, :status_date_time

    self.table_name = :envelope_events

    belongs_to :envelope, :class_name => 'Docusign::Envelope::Base'

    after_create :notify_envelope

    def notify_envelope
      envelope.post_new_status(status)
    end
  end
end