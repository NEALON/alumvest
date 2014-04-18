module Alumvest::Team
  class Base < ActiveRecord::Base
    include Alumvest::Team::State

    attr_accessible :team_members_attributes,
                    :team_highlights,
                    :campaign_id,
                    :campaign

    self.table_name = :teams

    has_many :team_members, :as => :populatable

    belongs_to :campaign, :class_name => 'Alumvest::Campaign::Base'

    accepts_nested_attributes_for :team_members, :reject_if => :all_blank, :allow_destroy => true
  end
end
