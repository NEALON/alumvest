require 'active_support/concern'

module Alumvest::Investment::Data
  extend ActiveSupport::Concern

  included do
    attr_accessible :status, :campaign, :campaign_id, :investor, :investor_id, :amount_cents

    monetize :amount_cents

    self.table_name = :investments

    belongs_to :campaign, :class_name => 'Alumvest::Campaign::Base'
    belongs_to :investor, :class_name => 'Alumvest::Investor::Base'

    has_one :contract_doc_group,
            :class_name => 'Alumvest::ContractDocGroup',
            :foreign_key => 'investment_id'
    has_one :subscription_agreement,
            :class_name => 'Alumvest::SubscriptionAgreement',
            :foreign_key => 'investment_id'

    has_one :bancbox_funding_xn, :class_name => 'Bancbox::FundingXn', :foreign_key => 'investment_id'

    # TODO: may need to be associated with some of the above entities
    has_many :signings, :dependent => :delete_all, :class_name => 'Alumvest::Signing::Base', :foreign_key => 'investment_id'

    validates_presence_of :amount
    validates :amount,
              :numericality => {:less_than_or_equal_to => 10000000} #max

    #  after_create :make_signings

    def make_signings
      [campaign.investment_term.subscription_docs, campaign.investment_term.other_docs].each do |collection|
        collection.where(:signature_required => true).each do |doc|
          doc.template.create_envelope(
              Alumvest::Signing::Base.create(
                  :investment => self,
                  :document => doc),
              {:name => investor.user.full_name,
              :email => investor.user.email})
        end
      end
    end
  end
end