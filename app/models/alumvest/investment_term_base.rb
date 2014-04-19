class Alumvest::InvestmentTermBase < ActiveRecord::Base
  include Alumvest::InvestmentTermState

  attr_accessible :fundraising_amount,
                  :min_investment,
                  :max_investment,
                  :campaign_length,
                  :equity_type,
                  :funds_retained,
                  :fees_paid_by,
                  :elevator_pitch,
                  :investment_details,
                  :business_plan_url,
                  :financial_statement_url,
                  :term_sheet_url,
                  :subscription_docs_attributes,
                  :other_docs_attributes,
                  :campaign_id,
                  :campaign

  self.table_name = :investment_terms

  belongs_to :campaign, :class_name => 'Alumvest::CampaignBase'

  has_many :subscription_docs, :as => :documentable
  accepts_nested_attributes_for :subscription_docs,
                                :reject_if => proc { |attributes| attributes['name'].blank? && attributes['file_url'].blank? },
                                :allow_destroy => true

  has_many :other_docs, :as => :documentable
  accepts_nested_attributes_for :other_docs,
                                :reject_if => proc { |attributes| attributes['name'].blank? && attributes['file_url'].blank? },
                                :allow_destroy => true

end