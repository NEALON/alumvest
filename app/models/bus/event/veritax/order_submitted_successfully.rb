class Bus::Event::Veritax::OrderSubmittedSuccessfully < Bus::Event::Veritax::OrderSubmitted

  def to_admin_partial_path
    'admins/veritax_order_submitted_successfully'
  end
end
