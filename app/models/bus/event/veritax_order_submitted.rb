class Bus::Event::VeritaxOrderSubmitted < Bus::Event
  attr_accessible :investor, :investor_id, :veritax_order, :veritax_order_id

  belongs_to :veritax_order, :class_name => 'Veritax::Order'
  belongs_to :investor
end
