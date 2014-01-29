require 'active_support/concern'

module Veritax::Order::State
  extend ActiveSupport::Concern

  included do
    state_machine :status, :initial => :draft do

      event :submit! do
        transition :draft => :submitted
        transition :errored => :submitted
      end
      after_transition :draft => :submitted, :do => :fire_order_submitted
      after_transition :errored => :submitted, :do => :fire_order_submitted

      event :error! do
        transition :draft => :errored
      end
      after_transition :draft => :errored, :do => :fire_order_errored

      event :complete! do
        transition :submitted => :completed
      end
      after_transition :submitted => :completed, :do => :fire_order_completed

      event :cancel! do
        transition :submitted => :canceled
      end
      after_transition :submitted => :canceled, :do => :fire_order_canceled

      state :draft
      state :errored
      state :submitted
      state :completed
      state :canceled
    end
  end
end