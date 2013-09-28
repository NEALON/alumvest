require 'active_support/concern'

module FinalizationStep
  extend ActiveSupport::Concern

  included do
    attr_accessible :status, :investment_finalization

    belongs_to :investment_finalization

    state_machine :status, :initial => :pending do
      event :completed do
        transition :pending => :completed
      end

      state :complete
    end
  end
end