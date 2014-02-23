module Alumvest
  class Document < ActiveRecord::Base
    attr_accessible :name, :file_url, :signature_required

    validates_presence_of [:name, :file_url]

    belongs_to :documentable, :polymorphic => true

    has_one :template,
            :class_name => 'Docusign::Template::Base',
            :foreign_key => 'document_id'
    has_one :signing,
            :class_name => 'Alumvest::Signing::Base',
            :foreign_key => 'document_id'
  end
end
