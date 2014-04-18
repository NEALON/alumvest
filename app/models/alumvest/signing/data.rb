require 'active_support/concern'

module Alumvest::Signing::Data
  extend ActiveSupport::Concern

  included do
    attr_accessible :status, :investment, :document

    self.table_name = :signings

    belongs_to :investment, :class_name => 'Alumvest::Investment::Base'
    belongs_to :document, :class_name => 'Alumvest::Document'

    has_one :envelope,
            :class_name => 'Docusign::Envelope::Base',
            :foreign_key => 'signing_id'
    has_many :signing_reviews,
             :class_name => 'Bus::Event::Investment::Signing::Review',
             :foreign_key => 'signing_id'

    def self.signed_by_investor
      where(:status => 'signed_by_investor').order('created_at DESC')
    end

    def self.investor_signature_approved
      where(:status => 'investor_signature_approved').order('created_at DESC')
    end
  end
end
