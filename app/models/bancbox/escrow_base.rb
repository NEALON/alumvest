class Bancbox::EscrowBase < ActiveRecord::Base

  # TODO: bancbox_status and status should probably be switched

  include Bancbox::EscrowState
  include Bancbox::EscrowEvents
  include Bancbox::EscrowTalksToBancbox
  include Network

  BANCBOX_STATUS_OPEN_PENDING = 'OPEN_PENDING'.freeze
  BANCBOX_STATUS_OPEN         = 'OPEN'.freeze
  BANCBOX_STATUS_CLOSED       = 'CLOSED'.freeze

  self.table_name = 'bancbox_escrows'

  belongs_to :issuer, :class_name => 'Bancbox::Issuer', :foreign_key => :bancbox_issuer_id
  belongs_to :campaign, :class_name => 'Alumvest::CampaignBase'

  has_many :bancbox_funding_xns,
           :class_name => 'Bancbox::FundingXn',
           :foreign_key => 'escrow_id'

  attr_accessible :name,
                  :start_date,
                  :close_date,
                  :funding_goal,
                  :minimum_funding_amount,
                  :maximum_funding_amount,
                  :securities_offered,
                  :issuer_signatory_email,
                  :issuer_signatory_name,
                  :issuer_signatory_title,
                  :campaign_id,
                  :campaign,
                  :issuer_id,
                  :issuer,
                  :over_funding_amount

  validates_presence_of [:name,
                         :start_date,
                         :close_date,
                         :funding_goal,
                         :minimum_funding_amount,
                         :maximum_funding_amount,
                         :securities_offered,
                         :issuer_signatory_email,
                         :issuer_signatory_name,
                         :issuer_signatory_title]

  def create_reference_id!
    if reference_id.blank?
      self.reference_id = SecureRandom.uuid
    end
  end

  def current_timestamp
    DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
  end

  def self.create_from_campaign(issuer_user, campaign)
    create(
        :issuer => (issuer_user.issuer.bancbox_issuer || (raise 'The campaign issuer needs to have an account on Bancbox')),
        :campaign => campaign,
        :name => campaign.company.company_name,
        :start_date => (start_date = (campaign.starts_on || Date.today)),
        :close_date => (start_date + campaign.investment_term.campaign_length.days + 14.days),
        :funding_goal => campaign.investment_term.fundraising_amount,
        :minimum_funding_amount => campaign.investment_term.min_investment,
        :maximum_funding_amount => campaign.investment_term.max_investment,
        :securities_offered => 'EQUITY',
        #:over_funding_amount => 0,
        :issuer_signatory_email => issuer_user.email,
        :issuer_signatory_name => issuer_user.full_name,
        :issuer_signatory_title => 'Issuer'
    )
  end
end