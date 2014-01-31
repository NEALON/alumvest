module Veritax::Order
  class Base < ActiveRecord::Base
    include Veritax::Order::Data
    include Veritax::Order::State
    include Veritax::Order::Events
    include Veritax::Order::VeritaxCalls
  end
end

