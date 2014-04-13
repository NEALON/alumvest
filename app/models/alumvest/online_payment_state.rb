require 'active_support/concern'

module Alumvest::OnlinePaymentState
  extend ActiveSupport::Concern

  included do
    state_machine :status, :initial => :unfunded do
      event :fund! do
        transition :unfunded => :funded, :if => :generate_funding_event
      end

      state :unfunded
      state :funded
    end
  end
end