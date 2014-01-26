class Bus::Event::VeritaxEvent::OrderSubmittedWithError < Bus::Event::VeritaxEvent::OrderSubmitted
  def to_admin_partial_path
    'admins/veritax_order_submitted_with_error'
  end
end
