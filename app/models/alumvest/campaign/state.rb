require 'active_support/concern'

module Alumvest::Campaign::State
  extend ActiveSupport::Concern

  included do
    state_machine :status, :initial => :draft do
      event :publish do
        transition :draft => :published, :if => :generate_published_event
      end

      state :published
      state :live
    end

    def self.reviewable;
      where(:status => 'published');
    end

    def self.live;
      where(:status => 'live');
    end

    def can_publish?
      (company && company.ready_for_review?) &&
          (team && team.ready_for_review?) &&
          (investment_term && investment_term.ready_for_review?)
    end
  end
end