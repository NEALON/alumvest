class Bus::Event::Campaign::WentLive < Bus::Event
  attr_accessible :campaign, :campaign_id, :issuer, :issuer_id

  belongs_to :campaign, :class_name => 'Alumvest::CampaignBase'
  belongs_to :issuer, :class_name => 'Alumvest::IssuerBase'

  def to_admin_partial_path
    'admins/events/campaigns/went_live'
  end
end