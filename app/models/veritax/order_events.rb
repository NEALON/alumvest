require 'active_support/concern'

module Veritax::OrderEvents
  extend ActiveSupport::Concern

  included do
    def fire_order_errored
      Bus::Event::VeritaxOrder::SubmittedWithError.create(:investor => investor, :veritax_order => self)
      InvestorMailer.veritax_order_status_updated(investor.user.email).deliver
    end

    def fire_order_submitted
      Bus::Event::VeritaxOrder::SubmittedSuccessfully.create(:investor => investor, :veritax_order => self)
      InvestorMailer.veritax_order_status_updated(investor.user.email).deliver
    end

    def fire_order_completed
      Bus::Event::VeritaxOrder::Completed.create(:veritax_order_id => self.id, :investor => investor)
      InvestorMailer.veritax_order_status_updated(investor.user.email).deliver
    end

    def fire_order_canceled
      Bus::Event::VeritaxOrder::Canceled.create(:veritax_order_id => self.id, :investor => investor)
      InvestorMailer.veritax_order_status_updated(investor.user.email).deliver
    end

    def fire_order_approved
      Bus::Event::VeritaxOrder::Approved.create(:veritax_order.id => self.id, :investor => investor)
      InvestorMailer.accredited_investor_approved(investor.user.email).deliver
      investor.approve!
    end

    def fire_order_rejected
      Bus::Event::VeritaxOrder::Rejected.create(:veritax_order_id => self.id, :investor => investor)
      InvestorMailer.accredited_investor_rejected(investor.user.email).deliver
    end
  end
end