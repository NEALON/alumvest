class Campaign < ActiveRecord::Base

  attr_accessible :status, :owner_id, :owner

  belongs_to :owner
  has_one :company
  has_one :team
  has_one :investment_term

  state_machine :status, :initial => :draft do 
    event :submit_for_review do
      transition :draft => :submitted_for_review
    end

    state :submitted_for_review
  end

  # scopes

  def self.active
    where(:status => "active")
  end

  def self.reviewable
    where(:status => "submitted_for_review")
  end

  def can_submit_for_review?
    (company && company.ready_for_review?) &&
      (team && team.ready_for_review?) &&
        (investment_term && investment_term.ready_for_review?)
  end
end