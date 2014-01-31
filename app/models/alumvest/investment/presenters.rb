require 'active_support/concern'

module Alumvest::Investment::Presenters
  extend ActiveSupport::Concern

  included do
    def amount
      funding_level.try(:amount)
    end
  end
end