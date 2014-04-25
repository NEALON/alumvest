module Alumvest
  class EnvelopeWorkflowBase < ActiveRecord::Base
    #include Alumvest::EnvelopeWorkflowEvents
    #include Alumvest::EnvelopeWorkflowPresenters
    include Alumvest::EnvelopeWorkflowState

    attr_accessible :status,
                    :template, :template_id,
                    :contract_doc_group, :contract_doc_group_id

    self.table_name = :envelope_workflows

    belongs_to :contract_doc_group,
               :class_name => 'Alumvest::ContractDocGroup',
               :foreign_key => :contract_doc_group_id
    belongs_to :template,
               :class_name => 'Docusign::TemplateBase',
               :foreign_key => :template_id
  end
end