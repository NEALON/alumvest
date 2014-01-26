class Bus::Event::Veritax::OrderCanceled < Bus::Event::Veritax::OrderSubmitted

  def to_admin_partial_path
    'admins/veritax_order_canceled'
  end
end
