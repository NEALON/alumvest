class Signing < ActiveRecord::Base
  attr_accessible :status, :investment_finalization, :document

  belongs_to :investment_finalization
  belongs_to :document

  has_one :docusign_envelope
end
