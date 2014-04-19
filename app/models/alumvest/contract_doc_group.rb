module Alumvest
  class ContractDocGroup < ActiveRecord::Base
    include InvestmentStep

    def make_signable_document_envelopes

      signable_docs = investment.investment_terms.subscription_docs.requires_signature

      # this does not make sense because the envelopes should belong to the investment
      # or, more appropriately, an investment has many signable documents

      # make envelopes for docs that don't have one
      # make envelopes for docs that have investor_signature_rejected
      # and no subsequent signed_by_investor envelope or
      # investor_signature_approved envelope

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
