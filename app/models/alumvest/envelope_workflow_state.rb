require 'active_support/concern'

module Alumvest::EnvelopeWorkflowState
  extend ActiveSupport::Concern

  included do
    state_machine :status, :initial => :unsigned do
      state :unsigned
      state :completed
    end
  end
end