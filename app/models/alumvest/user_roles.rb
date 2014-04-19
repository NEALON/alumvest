require 'active_support/concern'

module Alumvest::UserRoles
  extend ActiveSupport::Concern

  included do
    def is_investor?
      user_type.downcase == 'investor'
    end

    def is_self_accredited_investor?
      self.investor.accredited_investor_status == 'self'
    end

    def is_accredited_investor?
      return false unless self.is_investor?
      self.investor.accredited_investor_status == 'approved'
    end

    def is_issuer?
      user_type.downcase == 'issuer'
    end

    def is_admin?
      user_type.downcase == 'admin'
    end

    def finishes_self_accredited_form?
      self.is_investor? and self.investor.finishes_self_accredited_form?
    end

    def when_admin(&block)
      yield if is_admin?;
    end

    def when_investor(&block)
      yield if is_investor?;
    end

    def when_issuer(&block)
      yield if is_issuer?;
    end

    def user_type_undefined?
      !is_issuer? && !is_investor? && !is_admin?
    end

    def update_user_type
      if self.user_type_changed?
        if self.is_investor?
          self.investor = Alumvest::InvestorBase.new
        end
        if self.is_issuer?
          self.issuer = Alumvest::IssuerBase.new
        end
      end
    end
  end
end
