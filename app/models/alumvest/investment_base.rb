class Alumvest::InvestmentBase < ActiveRecord::Base
  include Alumvest::InvestmentState
  include ActionView::Helpers::NumberHelper

  attr_accessible :status, :campaign, :campaign_id, :investor, :investor_id, :amount, :payment_type,:created_at

  self.table_name = :investments

  belongs_to :campaign, :class_name => 'Alumvest::CampaignBase'
  belongs_to :investor, :class_name => 'Alumvest::InvestorBase'

  has_one :online_payment,
          :class_name => 'Alumvest::OnlinePaymentBase',
          :foreign_key => 'investment_id'
  has_one :contract_doc_group,
          :class_name => 'Alumvest::ContractDocGroup',
          :foreign_key => 'investment_id'

  has_one :bancbox_funding_xn, :class_name => 'Bancbox::FundingXn', :foreign_key => 'investment_id'

  # TODO: may need to be associated with some of the above entities
  has_many :signings, :dependent => :delete_all, :class_name => 'Alumvest::SigningBase', :foreign_key => 'investment_id'

  validates_presence_of :amount
  validate { not_lt_min_investment_amount(:amount) }
  validate { not_gt_max_investment_amount(:amount) }

 def amount=(num)
    num.gsub!(',','') if num.is_a?(String)
    self[:amount] = num
 end

  def not_lt_min_investment_amount(attr)
    min = campaign.investment_term.min_investment
    errors.add(attr.to_sym, "must be at least #{number_to_currency(min)}") if send(attr) < min
  end

  def not_gt_max_investment_amount(attr)
    max = campaign.investment_term.max_investment
    errors.add(attr.to_sym, "must be no more than #{number_to_currency(max)}") if send(attr) > max
  end
  
  def has_online_payment?
     online_payment
  end
end