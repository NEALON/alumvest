namespace :veritax do
  task :update_orders => :environment do
    Veritax::Order::Base.update_order_statuses!
  end
end

