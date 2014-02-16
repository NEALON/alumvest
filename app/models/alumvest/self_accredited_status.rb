module Alumvest
  class SelfAccreditedStatus < ActiveRecord::Base
    attr_accessible :investor, :investor_id
    attr_accessible :financial_status, :term_startup_fail, :term_responsible, :term_av_permission, :term_tos

    belongs_to :investor, :class_name => 'Alumvest::Investor::Base'
    validate :validation

    def validation
      for term in [:term_startup_fail, :term_responsible, :term_av_permission, :term_tos]
        if not self[term]
          errors.add(term, "has to be checked")
        end
      end
      if financial_status.nil?
        errors.add(:financial_status, "needs to be selected")
      end
    end

    def accredited?
      term_startup_fail and term_responsible and term_av_permission and term_tos and (financial_status != 4)
    end
  end
end
