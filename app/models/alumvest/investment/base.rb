module Alumvest::Investment
  class Base < ActiveRecord::Base
    include Alumvest::Investment::Data
    include Alumvest::Investment::State
  end
end
