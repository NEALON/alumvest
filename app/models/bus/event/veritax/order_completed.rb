class Bus::Event::Veritax::OrderCompleted < Bus::Event::Veritax::OrderSubmitted

  def to_admin_partial_path
    'admins/veritax_order_completed'
  end
end
