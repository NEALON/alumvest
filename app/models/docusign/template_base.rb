class Docusign::TemplateBase < ActiveRecord::Base
  include Docusign::TemplateDocusignCalls

  attr_accessible :docusign_template_id, :name

  self.table_name = :templates

  has_many :signings,
           :class_name => 'Alumvest::SigningBase',
           :foreign_key => :template_id

  has_many :documents,
           :class_name => 'Alumvest::Document',
           :foreign_key => :template_id
end