class CompanyPersonnelForm < ActiveRecord::Base
  attr_accessible :founders_attributes, :team_members_attributes, :board_members_attributes, :advisors_attributes

  has_many :founders, :as => :populatable
  has_many :team_members, :as => :populatable
  has_many :board_members, :as => :populatable
  has_many :advisors, :as => :populatable

  accepts_nested_attributes_for :founders, :allow_destroy => true
  accepts_nested_attributes_for :team_members, :allow_destroy => true
  accepts_nested_attributes_for :board_members, :allow_destroy => true
  accepts_nested_attributes_for :advisors, :allow_destroy => true
end