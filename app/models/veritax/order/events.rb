require 'active_support/concern'

module Veritax::Order::Events
  extend ActiveSupport::Concern

  included do
    def fire_order_errored
      Bus::Event::VeritaxEvent::OrderSubmittedWithError.create(:investor => investor, :veritax_order => self)
    end

    def fire_order_submitted
      Bus::Event::VeritaxEvent::OrderSubmittedSuccessfully.create(:investor => investor, :veritax_order => self)
    end

    def fire_order_completed
      Bus::Event::VeritaxEvent::OrderCompleted.create(:veritax_order => self, :investor => investor)
    end

    def fire_order_canceled
      Bus::Event::VeritaxEvent::OrderCanceled.create(:veritax_order => self, :investor => investor)
    end
  end
end