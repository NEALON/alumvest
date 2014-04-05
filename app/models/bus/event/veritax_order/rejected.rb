class Bus::Event::VeritaxOrder::Rejected < Bus::Event::VeritaxOrder::Base

  def to_admin_partial_path
    'admins/events/veritax_orders/rejected'
  end

  def to_partial_path
    '/bus/event/veritax_order/rejecteds/rejected'
  end
end
