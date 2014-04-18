class Bus::Event::Investment::Signing::Review < Bus::Event
  attr_accessible :admin,
                  :admin_id,
                  :signing,
                  :signing_id,
                  :investor,
                  :investor_id

  belongs_to :signing, :class_name => 'Alumvest::Signing::Base'
  belongs_to :admin, :class_name => 'Alumvest::User::Base'
  belongs_to :investor, :class_name => 'Alumvest::Investor::Base'

  after_create :update_signing_status

  def update_signing_status
    # abstract
  end
end
