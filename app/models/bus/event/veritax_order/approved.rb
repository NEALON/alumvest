class Bus::Event::VeritaxOrder::Approved < Bus::Event::VeritaxOrder::Base

  def to_admin_partial_path
    'admins/events/veritax_orders/approved'
  end

  def to_partial_path
    '/bus/event/veritax_order/approveds/approved'
  end
end
