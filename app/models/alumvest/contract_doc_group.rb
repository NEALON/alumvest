module Alumvest
  class ContractDocGroup < ActiveRecord::Base
    include InvestmentStep

    has_many :signings,
             :class_name => 'Alumvest::SigningBase',
             :foreign_key => :contract_doc_group_id

    def create_signings_for(templates)
      templates.each do |template|
        unless signings.where(:status => 'unsigned', :template_id => template.id)
          signings.create(:template_id => template.id)
        end
      end
    end
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
