class Bus::Event::VeritaxOrder::SubmittedWithError < Bus::Event::VeritaxOrder::Base

  def to_admin_partial_path
    'admins/events/veritax_orders/submitted_with_error'
  end

  def to_partial_path
    '/bus/event/veritax_order/submitted_with_errors/submitted_with_error'
  end
end
