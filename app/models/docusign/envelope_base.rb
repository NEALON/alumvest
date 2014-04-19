class Docusign::EnvelopeBase < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  delegate :default_url_options, :to => ActionMailer::Base

  include Docusign::EnvelopeDocusignCalls

  attr_accessible :envelope_id, :email_body, :email_subject, :uri, :template_id, :signing

  self.table_name = :envelopes

  belongs_to :template, :class_name => 'Docusign::TemplateBase'
  belongs_to :signing, :class_name => 'Alumvest::SigningBase'
  has_many :events, :class_name => 'Docusign::EnvelopeEventBase', :foreign_key => 'envelope_id'
end