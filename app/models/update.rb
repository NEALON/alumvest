class Update < ActiveRecord::Base
  attr_accessible :subject, :details, :visibility, :video_url, :company, :company_id

  belongs_to :company

  validates_presence_of [:subject, :details, :visibility]
end