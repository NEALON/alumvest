module Alumvest::Signing
  class Base < ActiveRecord::Base
    include Alumvest::Signing::Presenters
    include Alumvest::Signing::State

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

    def remove_investor_reviewer
      unless Rails.env.test?
        # TODO: this belongs in envelope#talks_to_docusign
        client = DocusignRest::Client.new
        envelope_id = envelope.envelope_id
        recipients = client.get_envelope_recipients(:envelope_id => envelope_id)
        recipient_id = recipients['signers'].select { |s| s["roleName"] == "investor-reviewer" }.first["recipientId"]
        result = client.delete_envelope_recipient({:envelope_id => envelope_id, :recipient_id => recipient_id})
        begin
          result['signers'].first['status'] == 'deleted'
        rescue
          # TODO: log some stuff, eh?
          false
        end
      else # we are in test
        true
      end
    end
  end
end