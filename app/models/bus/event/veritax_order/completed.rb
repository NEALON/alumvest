class Bus::Event::VeritaxOrder::Completed < Bus::Event::VeritaxOrder::Base

  def to_admin_partial_path
    'admins/events/veritax_orders/completed'
  end
end
