module Alumvest::InvestmentTerm
  class Base < ActiveRecord::Base
     include Alumvest::InvestmentTerm::Data
     include Alumvest::InvestmentTerm::State
  end
end