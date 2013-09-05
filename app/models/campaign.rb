class Campaign < ActiveRecord::Base

  attr_accessible :status, :owner_id, :owner

  belongs_to :owner
  has_one :company
  has_one :team
  has_one :investment_term

  state_machine :status, :initial => :draft do 
    event :submit_for_review do
      transition :draft => :submitted_for_review, :if => :all_valid?
    end

    state :submitted_for_review
  end

  def all_valid?
    @invalid_items = []
    @invalid_items << "Company" unless company.valid?
    @invalid_items << "Team" unless team.valid?
    @invalid_items << "Investment Terms" unless investment_term.valid?
    @invalid_items.blank?
  end

  # scopes

  def self.active
    where(:status => "active")
  end
end