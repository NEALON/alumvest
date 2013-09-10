class Investment < ActiveRecord::Base
  attr_accessible :amount, :status, :campaign, :campaign_id, :investor, :investor_id

  validates_presence_of :amount
  validates_numericality_of :amount

  belongs_to :campaign
  belongs_to :investor

  state_machine :status, :initial => :draft do
    event :fund do
      transition :draft => :funded
    end

    state :funded
  end
end
