require 'active_support/concern'

module Veritax::Order::Batch
  extend ActiveSupport::Concern

  included do
    def self.update_order_statuses!
      submitted.each{|order| order.get_order_info!}
    end
  end
end