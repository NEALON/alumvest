class Alumvest::CampaignBase < ActiveRecord::Base

  include Alumvest::CampaignEvents
  include Alumvest::CampaignPresenters
  include Alumvest::CampaignState

  attr_accessible :status, :issuer_id, :issuer

  self.table_name = :campaigns

  belongs_to :issuer,
             :class_name => 'Alumvest::IssuerBase'
  has_one :company,
          :class_name => 'Alumvest::CompanyBase',
          :foreign_key => 'campaign_id'
  has_one :team,
          :class_name => 'Alumvest::TeamBase',
          :foreign_key => 'campaign_id'
  has_one :investment_term,
          :class_name => 'Alumvest::InvestmentTermBase',
          :foreign_key => 'campaign_id'
  has_one :bancbox_escrow,
          :class_name => 'Bancbox::EscrowBase',
          :foreign_key => 'campaign_id'
  has_one :review,
          :class_name => 'Alumvest::Review',
          :foreign_key => 'campaign_id'
  has_many :investments,
           :class_name => 'Alumvest::InvestmentBase',
           :foreign_key => 'campaign_id'
  has_many :investors,
           :through => :investments,
           :class_name => 'Alumvest::InvestorBase'
  has_many :follows,
           :dependent => :destroy,
           :class_name => 'Alumvest::Follow',
           :foreign_key => 'campaign_id'

  def raised
    investments.where(:status => 'pending').sum(:amount)
  end

  def close_escrow
    bancbox_escrow.close_account!
  end

  def cancel_escrow
    bancbox_escrow.cancel!
  end
  
  def recent_investment
    investments.order('created_at DESC').first
  end
end
