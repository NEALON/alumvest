class Document < ActiveRecord::Base
  attr_accessible :name, :file_url

  validates_presence_of [:name, :file_url]

  belongs_to :documentable, :polymorphic => true
end