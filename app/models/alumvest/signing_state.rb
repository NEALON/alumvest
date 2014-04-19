require 'active_support/concern'

module Alumvest::SigningState
  extend ActiveSupport::Concern

  included do
    state_machine :status, :initial => :unsigned do
      event :sign_by_investor! do
        transition :unsigned => :signed_by_investor
      end

      event :approve_investor_signature! do
        transition :signed_by_investor => :investor_signature_approved, :if => :remove_investor_reviewer
      end

      event :reject_investor_signature! do
        # TO DO: void the envelope
        transition :signed_by_investor => :investor_signature_rejected
      end

      event :cancel! do
        transition :unsigned => :canceled
      end
      event :decline! do
        transition :unsigned => :declined
      end

      state :signed_by_investor
      state :investor_signature_approved
      state :investor_signature_rejected

      state :canceled
      state :declined
    end

    def post_new_status(status)
      case status
        when 'signing_complete'
          sign_by_investor!
        when 'cancel'
          cancel!
        when 'decline'
          decline!
      end
    end
  end
end