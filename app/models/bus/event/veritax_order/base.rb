# this is a base class for successful and error order submissions
class Bus::Event::VeritaxOrder::Base < Bus::Event
  attr_accessible :investor, :investor_id, :veritax_order, :veritax_order_id

  belongs_to :veritax_order, :class_name => 'Veritax::Order::Base'
  belongs_to :investor, :class_name => 'Alumvest::Investor::Base'
end
