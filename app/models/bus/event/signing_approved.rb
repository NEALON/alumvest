class Bus::Event::SigningApproved < Bus::Event::SigningReview

  def update_signing_status
    signing.approve_investor_signature!
  end
end
