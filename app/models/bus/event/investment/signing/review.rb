class Bus::Event::Investment::Signing::Review < Bus::Event
  attr_accessible :admin,
                  :admin_id,
                  :envelope,
                  :envelope_id,
                  :investor,
                  :investor_id

  belongs_to :envelope, :class_name => 'Docusign::EnvelopeBase'
  belongs_to :admin, :class_name => 'Alumvest::UserBase'
  belongs_to :investor, :class_name => 'Alumvest::InvestorBase'

  after_create :update_signing_status

  def update_signing_status
    # abstract
  end
end
