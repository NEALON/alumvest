class Bus::Event::Investment::Signing::Rejected < Bus::Event::Investment::Signing::Review

  def update_signing_status
    signing.reject_investor_signature!
  end
end
