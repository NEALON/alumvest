require 'active_support/concern'

module Bancbox::EscrowEvents
  extend ActiveSupport::Concern

  included do

    def generate_opened_event
      # raise campaign.issuer.inspect
      Bus::Event::BancboxEscrow::Opened.create(
              :campaign => campaign,
              :bancbox_escrow => self,
              :issuer => campaign.issuer
      )
    end
  end
end