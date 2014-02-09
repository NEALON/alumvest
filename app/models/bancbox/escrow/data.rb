require 'active_support/concern'

module Bancbox::Escrow::Data
  extend ActiveSupport::Concern

  included do
    self.table_name = 'bancbox_escrows'

    belongs_to :issuer, class_name: 'Bancbox::Issuer', :foreign_key => :bancbox_issuer_id
    belongs_to :campaign, :class_name => 'Alumvest::Campaign::Base'

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
                    :issuer

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
  end
end