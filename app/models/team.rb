class Team < ActiveRecord::Base
  attr_accessible :legal_counsel_attributes,
                  :founders_attributes,
                  :team_members_attributes,
                  :board_members_attributes,
                  :advisors_attributes,
                  :company_worksheet_id

  has_many :legal_counsel, :as => :populatable # but is treated as though has_one in UI
  has_many :founders, :as => :populatable
  has_many :team_members, :as => :populatable
  has_many :board_members, :as => :populatable
  has_many :advisors, :as => :populatable

  belongs_to :company_worksheet

  accepts_nested_attributes_for :legal_counsel, :reject_if => :all_blank
  accepts_nested_attributes_for :founders, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :team_members, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :board_members, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :advisors, :reject_if => :all_blank, :allow_destroy => true

  state_machine :status, :initial => :draft do
    event :make_ready_for_review do
      transition :draft => :ready_for_review
    end

    state :ready_for_review do
      validates :team_members, :presence => true
    end
  end
end