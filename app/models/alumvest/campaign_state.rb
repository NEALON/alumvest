require 'active_support/concern'

module Alumvest::CampaignState
  extend ActiveSupport::Concern

  included do
    state_machine :status, :initial => :draft do
      event :publish do
        transition :draft => :published, :if => :generate_published_event
      end

      event :reject do
        transition :published => :rejected
      end

      event :accept do
        transition :published  => :accepted
      end

      event :create_escrow do
        transition :accepted => :escrow_created
      end

      event :go_live! do
        transition :escrow_created => :live, :if => :generate_went_live_event
      end

      event :disable! do
        transition :live => :disabled
      end

      event :enable! do
        transition :disabled => :live
      end

      event :close! do
        transition :live => :closed, :if => :close_escrow
      end

      event :cancel! do
        transition :live => :canceled, :if => :cancel_escrow
      end

      state :published # aka submitted by campaign creator for admin review

      state :rejected
      state :accepted
      state :escrow_created
      state :live
      state :disabled
      state :closed
      state :canceled
    end

    def self.reviewable
      where(:status => 'published')
    end

    def self.accepted
      where(:status => 'accepted')
    end

    def self.live
      where(:status => 'live')
    end

    def can_publish?
      (company && company.ready_for_review?) &&
          (team && team.ready_for_review?) &&
          (investment_term && investment_term.ready_for_review?)
    end
  end
end