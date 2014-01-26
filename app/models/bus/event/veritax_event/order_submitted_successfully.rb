class Bus::Event::VeritaxEvent::OrderSubmittedSuccessfully < Bus::Event::VeritaxEvent::OrderSubmitted

  def to_admin_partial_path
    'admins/veritax_order_submitted_successfully'
  end
end
