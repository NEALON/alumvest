class Bus::Event::SigningReview < Bus::Event
  attr_accessible :admin, :signing, :admin_id, :signing_id

  belongs_to :signing, :class_name => 'Alumvest::Signing::Base'
  belongs_to :admin, :class_name => 'Alumvest::User::Base'

  after_create :update_signing_status

  def update_signing_status
    # abstract
  end
end
