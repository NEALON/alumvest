module Alumvest::Issuer
  class Base < ActiveRecord::Base
    include Alumvest::Issuer::Data
  end
end