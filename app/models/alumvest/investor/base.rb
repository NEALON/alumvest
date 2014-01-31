module Alumvest::Investor
  class Base < ActiveRecord::Base
    include Alumvest::Investor::Data
  end
end