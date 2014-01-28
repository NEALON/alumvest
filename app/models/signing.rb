class Signing < ActiveRecord::Base
  attr_accessible :status, :investment, :document

  belongs_to :investment
  belongs_to :document

  has_one :envelope
  has_many :signing_reviews

  after_create :make_envelope

  state_machine :status, :initial => :unsigned do
    event :sign_by_investor! do
      transition :unsigned => :signed_by_investor
    end

    event :approve_investor_signature! do
      transition :signed_by_investor => :investor_signature_approved, :if => :remove_investor_reviewer
    end

    event :reject_investor_signature! do
      # TO DO: void the envelope
      transition :signed_by_investor => :investor_signature_rejected
    end

    event :cancel! do
      transition :unsigned => :canceled
    end
    event :decline! do
      transition :unsigned => :declined
    end

    state :signed_by_investor
    state :investor_signature_approved
    state :investor_signature_rejected

    state :canceled
    state :declined
  end

  def remove_investor_reviewer
    # TODO: let envelope do this
    client = DocusignRest::Client.new
    envelope_id = envelope.envelope_id
    recipients = client.get_envelope_recipients(:envelope_id => envelope_id)
    recipient_id = recipients['signers'].select{|s| s["roleName"] == "investor-reviewer"}.first["recipientId"]
    result = client.delete_envelope_recipient({:envelope_id => envelope_id, :recipient_id => recipient_id})
    begin
      result['signers'].first['status'] == 'deleted'
    rescue
      # TODO: log some stuff, eh?
      false
    end
  end

  def status_for_end_user
    status == 'signed_by_investor' ? 'under review' : status
  end

  def make_envelope
    document.template.create_envelope(self, investment.investor)
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

  def self.investor_signature_approved
    where(:status => 'investor_signature_approved').order('created_at DESC')
  end

  def to_admin_partial_path
    'admins/investor_signing'
  end
end
