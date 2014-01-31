module Alumvest::Team
  class Base < ActiveRecord::Base
    include Alumvest::Team::Data
    include Alumvest::Team::State
  end
end
