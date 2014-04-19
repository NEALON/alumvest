module Alumvest
  class Document < ActiveRecord::Base
    attr_accessible :name, :file_url, :signature_required, :distribute_at_closing

    validates_presence_of [:name, :file_url]

    belongs_to :documentable, :polymorphic => true

    has_one :template,
            :class_name => 'Docusign::TemplateBase',
            :foreign_key => 'document_id'
    has_one :signing,
            :class_name => 'Alumvest::SigningBase',
            :foreign_key => 'document_id'

    def self.requires_signature
      where(:signature_required => true)
    end
  end
end
