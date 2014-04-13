class Bus::Event::Investment::Funded < Bus::Event
  attr_accessible :campaign, :campaign_id,:investment, :investment_id, :issuer, :issuer_id, :investor, :investor_id

  belongs_to :campaign,
             :class_name => 'Alumvest::Campaign::Base'
  belongs_to :investment,
             :class_name => 'Alumvest::Investment::Base'
  belongs_to :issuer,
             :class_name => 'Alumvest::Issuer::Base'
  belongs_to :investor,
             :class_name => 'Alumvest::Investor::Base'

  def to_admin_partial_path
    'admins/events/investments/funded'
  end
end