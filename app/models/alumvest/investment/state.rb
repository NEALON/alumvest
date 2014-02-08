require 'active_support/concern'

module Alumvest::Investment::State
  extend ActiveSupport::Concern

  included do
    state_machine :status, :initial => :pending do
      event :finalize do
        transition :pending => :finalized
      end
      state :finalized
    end

    def can_finalize?
      funding_level.try(:completed?) &&
          contract_doc_group.try(:completed?) &&
          subscription_agreement.try(:completed?)
    end

    def self.finalized
      all # TODO, for now
    end
  end
end