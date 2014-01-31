require 'active_support/concern'

module Alumvest::Signing::Presenters
  extend ActiveSupport::Concern

  included do
    def to_admin_partial_path
      'admins/investor_signing'
    end

    def status_for_end_user
      status == 'signed_by_investor' ? 'under review' : status
    end
  end
end