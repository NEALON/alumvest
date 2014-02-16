module Alumvest::Investor
  class Base < ActiveRecord::Base
    include Alumvest::Investor::Data

    def finishes_self_accredited_form?
      self_accredited_status and self_accredited_status.valid?
    end
  end
end
