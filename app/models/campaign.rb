class Campaign < ActiveRecord::Base

  attr_accessible :status, :owner_id, :owner

  belongs_to :owner
  has_one :company
  has_one :team
  has_one :investment_term
  has_many :investment_finalizations
  has_many :investments # TODO: probably obsolete, given investment_finalizations
  has_many :investors, :through => :investments
  has_many :follows, dependent: :destroy

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

  def humanize_time_left
    "#{investment_term.try(:campaign_length) || 'TBD'} days from campaign start"
  end

  def percent_complete_for_display
    investment_sum = investments.sum(:amount)
    if investment_sum == 0
      2 # so something shows in the progress bar
    else
      investment_sum / investment_term.fundraising_amount  * 100
    end
  end
end