class Bus::Event::Campaign::Rejected Bus::Event
  attr_accessible :campaign, :campaign_id, :issuer, :issuer_id

  belongs_to :campaign, :class_name => 'Alumvest::Campaign::Base'
  belongs_to :issuer, :class_name => 'Alumvest::Issuer::Base'

  def to_admin_partial_path
    'admins/campaign_rejected'
  end
end
