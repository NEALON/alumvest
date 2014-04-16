require 'active_support/concern'

module Alumvest::Campaign::Data
  extend ActiveSupport::Concern

  included do
    attr_accessible :status, :issuer_id, :issuer

    self.table_name = :campaigns

    belongs_to :issuer,
               :class_name => 'Alumvest::Issuer::Base'
    has_one :company,
            :class_name => 'Alumvest::Company::Base',
            :foreign_key => 'campaign_id'
    has_one :team,
            :class_name => 'Alumvest::Team::Base',
            :foreign_key => 'campaign_id'
    has_one :investment_term,
            :class_name => 'Alumvest::InvestmentTerm::Base',
            :foreign_key => 'campaign_id'
    has_one :bancbox_escrow,
            :class_name => 'Bancbox::Escrow::Base',
            :foreign_key => 'campaign_id'
    has_one :review,
            :class_name => 'Alumvest::Review',
            :foreign_key => 'campaign_id'
    has_many :investments,
             :class_name => 'Alumvest::Investment::Base',
             :foreign_key => 'campaign_id'
    has_many :investors,
             :through => :investments,
             :class_name => 'Alumvest::Investor::Base'
    has_many :follows,
             :dependent => :destroy,
             :class_name => 'Alumvest::Follow',
             :foreign_key => 'campaign_id'

    def raised
      investments.where(:status => 'pending').sum(:amount)
    end
  end
end