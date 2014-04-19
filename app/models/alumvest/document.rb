module Alumvest
  class Document < ActiveRecord::Base

    attr_accessible :name,
                    :file_url,
                    :signature_required,
                    :distribute_at_closing

    validates_presence_of [:name, :file_url]

    belongs_to :documentable, :polymorphic => true
    belongs_to :template,
            :class_name => 'Docusign::TemplateBase',
            :foreign_key => 'template_id'

    def self.requires_signature
      where(:signature_required => true)
    end
  end
end
