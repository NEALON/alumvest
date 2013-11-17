class BancboxInvestor < BancboxPersonBase

  attr_accessible :investor_type

  validates_presence_of [:investor_type], :on => :update

  belongs_to :user

  def submit!
    super do |options|
      return BancBoxCrowd.create_investor options
    end
  end

end
