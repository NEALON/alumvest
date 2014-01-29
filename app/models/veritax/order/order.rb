module Veritax::Order
  class Order < ActiveRecord::Base
    include Veritax::Order::Data
    include Veritax::Order::State
    include Veritax::Order::Events
    include Veritax::Order::VeritaxCalls
  end
end

