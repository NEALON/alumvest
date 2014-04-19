module Alumvest
  class Review < ActiveRecord::Base
    attr_accessible :campaign, :campaign_id, :result, :notes

    belongs_to :campaign, :class_name => 'Alumvest::CampaignBase'
  end
end
