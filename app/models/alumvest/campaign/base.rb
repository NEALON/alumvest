module Alumvest::Campaign
  class Base < ActiveRecord::Base
    include Alumvest::Campaign::Data
    include Alumvest::Campaign::State
    include Alumvest::Campaign::Events
    include Alumvest::Campaign::Presenters
  end
end
