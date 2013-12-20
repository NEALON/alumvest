class Investment < ActiveRecord::Base
  attr_accessible :status, :campaign, :investor

  belongs_to :campaign
  belongs_to :investor

  has_one :funding_level
  has_one :questionnaire
  has_one :contract_doc_group
  has_one :subscription_agreement
  has_one :irs_doc_group

  # TODO: may need to be associated with some of the above entities
  has_many :signings, :dependent => :delete_all

  after_create :make_signings

  def make_signings
    [campaign.investment_term.subscription_docs, campaign.investment_term.other_docs].each do |collection|
      collection.where(:signature_required => true).each do |doc|
        doc.template.create_envelope(
            Signing.create(
                :investment => self,
                :document => doc),
            {:name => investor.user.name,
            :email => investor.user.email})
      end
    end
  end

  state_machine :status, :initial => :pending do
    event :finalize do
      transition :pending => :finalized
    end
    state :finalized
  end

  def can_finalize?
    funding_level.try(:completed?) &&
        questionnaire.try(:completed?) &&
        contract_doc_group.try(:completed?) &&
        subscription_agreement.try(:completed?) &&
        irs_doc_group.try(:completed?)
  end

  def self.finalized
    all # TODO, for now
  end

  def amount
    funding_level.try(:amount)
  end
end