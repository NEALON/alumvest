class Bus::Event::Investment::Signing::Review < Bus::Event
  attr_accessible :admin,
                  :admin_id,
                  :signing,
                  :signing_id,
                  :investor,
                  :investor_id

  belongs_to :signing, :class_name => 'Alumvest::SigningBase'
  belongs_to :alumvest_signing_base, :class_name => 'Docusign::EnvelopeBase'
  belongs_to :admin, :class_name => 'Alumvest::UserBase'
  belongs_to :investor, :class_name => 'Alumvest::InvestorBase'

  after_create :update_signing_status

  def update_signing_status
    # abstract
  end
end
