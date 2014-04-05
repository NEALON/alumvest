class Bus::Event::VeritaxOrder::SubmittedSuccessfully < Bus::Event::VeritaxOrder::Base

  def to_admin_partial_path
    'admins/events/veritax_orders/submitted_successfully'
  end

  def to_partial_path
    '/bus/event/veritax_order/submitted_successfullies/submitted_successfully'
  end
end


