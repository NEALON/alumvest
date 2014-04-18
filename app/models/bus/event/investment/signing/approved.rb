class Bus::Event::Investment::Signing::Approved < Bus::Event::Investment::Signing::Review

  def update_signing_status
    signing.approve_investor_signature!
  end
end
