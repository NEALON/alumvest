module Alumvest::Person
  class Base < ActiveRecord::Base
    include Alumvest::Person::Data
  end
end

