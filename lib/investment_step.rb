require 'active_support/concern'

module InvestmentStep
  extend ActiveSupport::Concern

  included do
    attr_accessible :status, :investment, :investment_id

    belongs_to :investment, :class_name => 'Alumvest::InvestmentBase'

    state_machine :status, :initial => :incomplete do
      event :complete! do
        transition :incomplete => :completed
      end

      state :incomplete
      state :completed
    end
  end
end