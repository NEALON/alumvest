class Docusign::TemplateBase < ActiveRecord::Base
  include Docusign::TemplateDocusignCalls

  attr_accessible :docusign_template_id, :name

  self.table_name = :templates

  has_many :envelope_workflows,
           :class_name => 'Alumvest::EnvelopeWorkflowBase',
           :foreign_key => 'template_id'

  has_many :documents,
           :class_name => 'Alumvest::Document',
           :foreign_key => :template_id
end