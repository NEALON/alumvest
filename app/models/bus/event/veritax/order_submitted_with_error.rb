class Bus::Event::Veritax::OrderSubmittedWithError < Bus::Event::Veritax::OrderSubmitted
  def to_admin_partial_path
    'admins/veritax_order_submitted_with_error'
  end
end
