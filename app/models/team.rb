class Team < ActiveRecord::Base
  attr_accessible :team_members_attributes,
                  :team_highlights,
                  :campaign_id,
                  :campaign

  has_many :team_members, :as => :populatable

  belongs_to :campaign

  accepts_nested_attributes_for :team_members, :reject_if => :all_blank, :allow_destroy => true

  state_machine :status, :initial => :draft do
    event :make_ready_for_review do
      transition :draft => :ready_for_review
    end

    state :ready_for_review do
      validates :team_highlights, :presence => true
      validates :team_members, :presence => true
    end
  end
end