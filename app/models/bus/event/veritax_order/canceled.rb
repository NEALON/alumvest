class Bus::Event::VeritaxOrder::Canceled < Bus::Event::VeritaxOrder::Base

  def to_admin_partial_path
    'admins/events/veritax_orders/canceled'
  end
end
