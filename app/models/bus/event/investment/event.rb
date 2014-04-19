class Bus::Event::Investment::Event < ActiveRecord::Base

  attr_accessible :campaign, :campaign_id,
                  :investment, :investment_id,
                  :issuer, :issuer_id,
                  :investor, :investor_id,
                  :admin, :admin_id

  belongs_to :campaign,
             :class_name => 'Alumvest::CampaignBase'
  belongs_to :investment,
             :class_name => 'Alumvest::InvestmentBase'
  belongs_to :issuer,
             :class_name => 'Alumvest::IssuerBase'
  belongs_to :investor,
             :class_name => 'Alumvest::InvestorBase'
  belongs_to :admin,
             :class_name => 'Alumvest::UserBase'

end
