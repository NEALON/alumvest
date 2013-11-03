class Signing < ActiveRecord::Base
  attr_accessible :status, :investment_finalization, :document

  belongs_to :investment_finalization
  belongs_to :document

  has_one :envelope

  after_create :make_envelope

  state_machine :status, :initial => :unsigned do
    event :sign_by_investor! do
      transition :unsigned => :signed_by_investor
    end
    event :cancel! do
      transition :unsigned => :canceled
    end
    event :decline! do
      transition :unsigned => :declined
    end

    state :signed_by_investor
    state :canceled
    state :declined
  end

  def status_for_end_user
    status == 'signed_by_investor' ? 'under review' : status
  end

  def make_envelope
    document.template.create_envelope(self, investment_finalization.investor)
  end

  def post_new_status(status)
    case status
      when 'signing_complete'
        sign_by_investor!
      when 'cancel'
        cancel!
      when 'decline'
        decline!
    end
  end

  def self.signed_by_investor
    where(:status => 'signed_by_investor').order('created_at DESC')
  end
end
