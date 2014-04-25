module Alumvest
  class ContractDocGroup < ActiveRecord::Base
    include InvestmentStep

    has_many :envelope_workflows,
             :class_name => 'Alumvest::EnvelopeWorkflowBase',
             :foreign_key => :contract_doc_group_id

    def envelope_workflows_from(investment_term)
      investment_term.subscription_docs.collect { |sd| sd.template }.uniq.each do |template|
        Alumvest::EnvelopeWorkflowBase.create(
                  :contract_doc_group => self,
                  :template => template) unless envelope_workflows.include?(template)
      end
      envelope_workflows
    end

    def make_signable_document_envelopes
      # TODO: this goes somewhere else

      investment.investment_terms.subscription_docs.where(
          :signature_required => true).each do |doc|
        doc.template.create_envelope(
            Alumvest::SigningBase.create(
                :investment => investment,
                :document => doc),
            {:name => investment.investor.user.full_name,
             :email => investment.investor.user.email}
        )
      end
    end
  end
end
