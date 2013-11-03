class Signing < ActiveRecord::Base
  attr_accessible :status, :investment_finalization, :document

  belongs_to :investment_finalization
  belongs_to :document

  has_one :docusign_envelope

  after_create :make_envelope

  state_machine :status, :initial => :unsigned do
    event :sign! do
      transition :unsigned => :signed
    end
    event :cancel! do
      transition :unsigned => :canceled
    end
    event :decline! do
      transition :unsigned => :declined
    end

    state :signed
    state :canceled
    state :declined
  end

  def make_envelope
    document.docusign_template.create_envelope(self, investment_finalization.investor)
  end
end
