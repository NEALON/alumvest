require 'active_support/concern'

module Alumvest::Campaign::State
  extend ActiveSupport::Concern

  included do
    state_machine :status, :initial => :draft do
      event :submit_for_review do
        transition :draft => :submitted_for_review, :if => :generate_event
      end

      state :submitted_for_review
      state :live
    end

    def self.reviewable;
      where(:status => 'submitted_for_review');
    end

    def self.live;
      where(:status => 'live');
    end

    def can_submit_for_review?
      (company && company.ready_for_review?) &&
          (team && team.ready_for_review?) &&
          (investment_term && investment_term.ready_for_review?)
    end
  end
end