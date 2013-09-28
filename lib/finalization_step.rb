require 'active_support/concern'

module FinalizationStep
  extend ActiveSupport::Concern

  included do
    attr_accessible :status, :investment_finalization

    belongs_to :investment_finalization

    state_machine :status, :initial => :pending do
      event :complete do
        transition :pending => :completed
      end

      state :completed
    end
  end
end