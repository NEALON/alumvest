class Bancbox::Investor < Bancbox::PersonBase

  attr_accessible :investor_type, :banking_account, :banking_account_id

  belongs_to :banking_account, :class_name => 'Banking::Account', :foreign_key => 'banking_account_id'

  validates_presence_of [:investor_type], :on => :update

  def submit!(bank_account)
    super do |options|
      next BancBoxCrowd.create_investor options
    end
  end

  def get_details
    super do |options|
      next BancBoxCrowd.get_investor_details options
    end
  end
end
