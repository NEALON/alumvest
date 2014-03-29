class Bus::Event::Campaign::Published < Bus::Event
  attr_accessible :campaign, :campaign_id

  belongs_to :campaign, :class_name => 'Alumvest::Campaign::Base'

  def to_admin_partial_path
    'admins/campaign_published'
  end
end
