class Bus::Event::InvestmentInitiated < Bus::Event

  attr_accessible :campaign, :campaign_id, :investment, :investment_id, :investor, :investor_id

  belongs_to :campaign, :class_name => 'Alumvest::Campaign::Base'
  belongs_to :investment, :class_name => 'Alumvest::Investment::Base'
  belongs_to :investor, :class_name => 'Alumvest::Investor::Base'
end
