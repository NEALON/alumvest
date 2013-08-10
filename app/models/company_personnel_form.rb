class CompanyPersonnelForm < ActiveRecord::Base
  attr_accessible :legal_counsel_attributes,
                  :founders_attributes,
                  :team_members_attributes,
                  :board_members_attributes,
                  :advisors_attributes

  has_many :legal_counsel, :as => :populatable # but is treated as though has_one in UI
  has_many :founders, :as => :populatable
  has_many :team_members, :as => :populatable
  has_many :board_members, :as => :populatable
  has_many :advisors, :as => :populatable

  accepts_nested_attributes_for :legal_counsel
  accepts_nested_attributes_for :founders, :allow_destroy => true
  accepts_nested_attributes_for :team_members, :allow_destroy => true
  accepts_nested_attributes_for :board_members, :allow_destroy => true
  accepts_nested_attributes_for :advisors, :allow_destroy => true
end