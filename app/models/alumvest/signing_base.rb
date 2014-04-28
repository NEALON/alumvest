class Alumvest::SigningBase < ActiveRecord::Base

  include Alumvest::SigningPresenters
  include Alumvest::SigningState

  attr_accessible :status, :contract_doc_group, :document

  self.table_name = :signings

  belongs_to :contract_doc_group,
             :class_name => 'Alumvest::ContractDocGroup',
             :foreign_key => :contract_doc_group_id
  belongs_to :template,
             :class_name => 'Docusign::TemplateBase',
             :foreign_key => :template_id

  has_many :envelopes,
          :class_name => 'Docusign::EnvelopeBase',
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