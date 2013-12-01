class Bancbox::Escrow < ActiveRecord::Base
  belongs_to :issuer, class_name: 'Bancbox::Issuer', :foreign_key => :bancbox_issuer_id
  belongs_to :campaign

  attr_accessible :name, :start_date, :close_date, :funding_goal
  attr_accessible :minimum_funding_amount, :maximum_funding_amount, :securities_offered
  attr_accessible :issuer_signatory_email, :issuer_signatory_name, :issuer_signatory_title
  attr_accessible :campaign_id, :campaign
  attr_accessible :issuer_id, :issuer

  validates_presence_of [:name, :start_date, :close_date, :funding_goal]
  validates_presence_of [:minimum_funding_amount, :maximum_funding_amount, :securities_offered]
  validates_presence_of [:issuer_signatory_email, :issuer_signatory_name, :issuer_signatory_title]

  def create_reference_id!
    if reference_id.blank?
      self.reference_id = SecureRandom.uuid
    end
  end

  def open!
    return false unless self.valid?
    create_reference_id!
    options = {
      :name => name,
      :issuer_id => issuer.bancbox_id,
      :start_date => start_date.to_s,
      :close_date => close_date.to_s,
      :funding_goal => funding_goal,
      :created_by => issuer.name,
      :minimum_funding_amount => minimum_funding_amount,
      :maximum_funding_amount => maximum_funding_amount,
      :securities_offered => securities_offered,
      :issuer_signatory_name => issuer_signatory_name,
      :issuer_signatory_email => issuer_signatory_email,
      :issuer_signatory_title => issuer_signatory_title,
      :platform_signatory_name => "Lynn Chen",
      :platform_signatory_email => "kyle@alumvest.com",
      :platform_signatory_title => "CEO"
    }
    options[:over_funding_amount] = over_funding_amount unless over_funding_amount.blank?
    puts options
    begin
      ret = BancBoxCrowd.create_escrow options
      self.bancbox_id = ret['id']
      self.status = ret['status']
      self.current_balance = ret['current_balance']
      self.total_funding = ret['total_funding']
      save
      return true
    rescue BancBoxCrowd::Error
      return false
    end
  end

  def get_details
    options = {
      :escrow_id => bancbox_id
    }
    return BancBoxCrowd.get_escrow_details options
  end
end
