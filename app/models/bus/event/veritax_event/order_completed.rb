class Bus::Event::VeritaxEvent::OrderCompleted < Bus::Event::VeritaxEvent::OrderSubmitted

  def to_admin_partial_path
    'admins/veritax_order_completed'
  end
end
