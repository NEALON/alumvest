require 'active_support/concern'

module Docusign::Template::Data
  extend ActiveSupport::Concern

  included do
    attr_accessible :template_id

    self.table_name = :templates

    has_many :envelopes, :class_name => 'Docusign::Envelope::Base', :foreign_key => 'template_id'
    belongs_to :document, :class_name => 'Alumvest::Document'
  end
end