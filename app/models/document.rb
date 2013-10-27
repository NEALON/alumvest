class Document < ActiveRecord::Base
  attr_accessible :name, :file_url, :signature_required

  validates_presence_of [:name, :file_url]

  belongs_to :documentable, :polymorphic => true
  has_one :docusign_template
  has_one :signing
end