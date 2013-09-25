class Job < ActiveRecord::Base
  belongs_to :company
  attr_accessible :contact, :description, :title, :company, :company_id
  validates_presence_of [:contact, :title, :description]
end
