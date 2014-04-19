require 'active_support/concern'

module Alumvest::SigningPresenters
  extend ActiveSupport::Concern

  included do
    def to_admin_partial_path
      'admins/investor_signing'
    end

    def status_for_end_user
      case status
        when 'signed_by_investor'
          'under review'
        when 'investor_signature_rejected'
          'voided by administrator'
        else
          status
      end
    end
  end
end