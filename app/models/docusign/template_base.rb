class Docusign::TemplateBase < ActiveRecord::Base
  include Docusign::TemplateDocusignCalls

  attr_accessible :template_id

  self.table_name = :templates

  has_many :envelopes, :class_name => 'Docusign::EnvelopeBase', :foreign_key => 'template_id'
  belongs_to :document, :class_name => 'Alumvest::Document'
end