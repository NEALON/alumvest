module Docusign::Template
  class Base < ActiveRecord::Base
    include Docusign::Template::DocusignCalls

    attr_accessible :template_id

    self.table_name = :templates

    has_many :envelopes, :class_name => 'Docusign::Envelope::Base', :foreign_key => 'template_id'
    belongs_to :document, :class_name => 'Alumvest::Document'
  end
end
