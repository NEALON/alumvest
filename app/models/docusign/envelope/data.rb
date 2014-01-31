require 'active_support/concern'

module Docusign::Envelope::Data
  extend ActiveSupport::Concern

  included do
    attr_accessible :envelope_id, :email_body, :email_subject, :uri, :template_id, :signing

    self.table_name = :envelopes

    belongs_to :template, :class_name => 'Docusign::Template::Base'
    belongs_to :signing, :class_name => 'Alumvest::Signing::Base'
    has_many :events, :class_name => 'Docusign::EnvelopeEvent::Base', :foreign_key => 'envelope_id'
  end
end