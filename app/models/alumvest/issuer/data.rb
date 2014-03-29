require 'active_support/concern'

module Alumvest::Issuer::Data
  extend ActiveSupport::Concern

  included do
    self.table_name = :issuers

    attr_accessible :experience, :expertise, :financial_info, :marital_status, :personal_message, :ssn, :user
    attr_encrypted :ssn, :key => Rails.env.test? ? 'ssn_secret' : ENV['SSN_SECRET']

    belongs_to :user, :class_name => 'Alumvest::User::Base'

    has_one :campaign,
            :class_name => 'Alumvest::Campaign::Base',
            :foreign_key => 'issuer_id'
    has_one :bancbox_issuer,
            :class_name => 'Bancbox::Issuer',
            :foreign_key => 'issuer_id'
    has_many :events,
             :class_name => 'Bus::Event',
             :foreign_key => 'issuer_id'

    validates :ssn, ssn: true, :allow_blank => true
  end
end