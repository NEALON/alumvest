class Bus::Event::InvestmentInitiated < Bus::Event

  attr_accessible :campaign, :campaign_id, :investment, :investment_id, :investor, :investor_id

  belongs_to :campaign, :class_name => 'Alumvest::CampaignBase'
  belongs_to :investment, :class_name => 'Alumvest::InvestmentBase'
  belongs_to :investor, :class_name => 'Alumvest::InvestorBase'
end
