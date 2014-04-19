require 'active_support/concern'

module Bancbox::EscrowState
  extend ActiveSupport::Concern

  included do
    state_machine :bancbox_status, :initial => :unsubmitted do
      state :open_pending
      state :opened
      state :modify_pending
      state :close_pending
      state :closed
      state :cancel_pending
      state :cancel
      state :disburse_pending
      event :submit_open do
        transition :unsubmitted => :open_pending
      end
      event :submit_close do
        transition all => :close_pending
      end
      event :submit_cancel do
        transition all => :cancel_pending
      end
      event :submit_disburse do
        transition all => :disburse_pending
      end
      event :escrow_opened do
        transition all => :opened
      end
      event :escrow_closed do
        transition all => :closed
      end
    end

  end
end