class Campaign < ActiveRecord::Base

  attr_accessible :status, :owner_id, :owner

  belongs_to :owner
  has_one :company
  has_one :team
  has_one :investment_term
  has_many :investments
  has_many :investors, :through => :investments

  state_machine :status, :initial => :draft do 
    event :submit_for_review do
      transition :draft => :submitted_for_review
    end

    state :submitted_for_review
    state :live
  end

  # scopes

  def self.reviewable
    where(:status => "submitted_for_review")
  end

  def self.live
    where(:status => "live")
  end

  def can_submit_for_review?
    (company && company.ready_for_review?) &&
      (team && team.ready_for_review?) &&
        (investment_term && investment_term.ready_for_review?)
  end
end