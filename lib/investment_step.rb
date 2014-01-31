require 'active_support/concern'

module InvestmentStep
  extend ActiveSupport::Concern

  included do
    attr_accessible :status, :investment, :investment_id

    belongs_to :investment, :class_name => 'Alumvest::Investment::Base'

    state_machine :status, :initial => :pending do
      event :complete do
        transition :pending => :completed
      end

      state :completed
    end
  end
end