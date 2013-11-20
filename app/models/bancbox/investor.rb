class Bancbox::Investor < Bancbox::PersonBase

  attr_accessible :investor_type

  validates_presence_of [:investor_type], :on => :update

  belongs_to :user

  def submit!
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
