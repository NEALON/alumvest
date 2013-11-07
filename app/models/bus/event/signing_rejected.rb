class Bus::Event::SigningRejected < Bus::Event::SigningReview

  def update_signing_status
    signing.reject_investor_signature!
  end
end
