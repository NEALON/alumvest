class Bus::Event::SigningReview < Bus::Event
  attr_accessible :admin, :signing, :admin_id, :signing_id

  belongs_to :signing
  belongs_to :admin, :class_name => 'User'

  after_create :update_signing_status

  def update_signing_status
    # NO OP, to be overridden
  end
end
