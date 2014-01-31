module Alumvest::Company
  class Base < ActiveRecord::Base
    include Alumvest::Company::Data
    include Alumvest::Company::State
    include Alumvest::Company::Presenters
  end
end

