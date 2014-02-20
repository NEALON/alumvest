class Bus::Event::VeritaxEvent::OrderSubmittedSuccessfully < Bus::Event::VeritaxEvent::OrderSubmitted

  def to_admin_partial_path
    'admins/veritax_order_submitted_successfully'
  end

  def to_partial_path
    '/bus/event/veritax_event/order_submitted_successfullies/order_submitted_successfully'
  end
end


