module Alumvest
  class Follow < ActiveRecord::Base
    belongs_to :user, :class_name => 'Alumvest::UserBase'
    belongs_to :campaign, :class_name => 'Alumvest::CampaignBase'
    validates :user_id, :presence => true
    validates :campaign_id, :presence => true
    attr_accessible :user_id, :campaign_id, :user, :campaign
  end
end

