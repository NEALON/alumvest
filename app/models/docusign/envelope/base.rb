module Docusign::Envelope
  class Base < ActiveRecord::Base
    include Rails.application.routes.url_helpers
    delegate :default_url_options, :to => ActionMailer::Base

    include Docusign::Envelope::DocusignCalls

    attr_accessible :envelope_id, :email_body, :email_subject, :uri, :template_id, :signing

    self.table_name = :envelopes

    belongs_to :template, :class_name => 'Docusign::Template::Base'
    belongs_to :signing, :class_name => 'Alumvest::Signing::Base'
    has_many :events, :class_name => 'Docusign::EnvelopeEvent::Base', :foreign_key => 'envelope_id'
  end
end