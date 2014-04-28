class Bus::Event::VeritaxOrder::Base < Bus::Event
  attr_accessible :investor, :investor_id, :veritax_order, :veritax_order_id

  belongs_to :veritax_order, :class_name => 'Veritax::OrderBase'
  belongs_to :investor, :class_name => 'Alumvest::InvestorBase'
end
