class Follow < ActiveRecord::Base
  belongs_to :user
  belongs_to :campaign
  validates :user_id, presence: true
  validates :campaign_id, presence: true
  attr_accessible :user_id, :campaign_id, :user, :campaign
end
