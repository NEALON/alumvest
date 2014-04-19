require 'active_support/concern'

module Alumvest::TeamState
  extend ActiveSupport::Concern

  included do
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
end