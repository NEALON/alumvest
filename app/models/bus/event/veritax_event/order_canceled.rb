class Bus::Event::VeritaxEvent::OrderCanceled < Bus::Event::VeritaxEvent::OrderSubmitted

  def to_admin_partial_path
    'admins/veritax_order_canceled'
  end
end
