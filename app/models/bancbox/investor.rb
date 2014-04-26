class Bancbox::Investor < Bancbox::PersonBase

  attr_accessible :investor_type, :investor, :investor_id

  belongs_to :investor,
             :class_name => 'Alumvest::InvestorBase',
             :foreign_key => "investor_id"

  has_many :bancbox_investments,
           :class_name => 'Bancbox::Investment',
           :foreign_key => 'bancbox_investor_id'

  validates_presence_of [:investor_type], :on => :update

  def refresh_investments
    begin
      bancbox_investments.delete_all
      if Rails.env.test?
        details = get_mock_details
      else
        details = get_details
      end
      details['investments'].try(:each) do |i|
        bancbox_investments.create(
            :project => i['project'],
            :investment_date => i['investment_date'],
            :amount => i['amount'],
            :is_refunded => (i['is_refunded'] == 'N' ? false : true),
            :is_cfp_fee_refunded => (i['is_cfp_fee_refunded'] == 'N' ? false : true),
            :is_reversed => (i['is_reversed'] == 'NO' ? false : true),
            :can_reverse => (i['can_reverse'] == 'NO' ? false : true)
        )
      end
      bancbox_investments
    #rescue Exception => e
    #  if e.message.include?("No investor exist with the specified information.")
    #    TODO: return something and maybe rollback
      #else
      #  raise e
      #end
    end
  end

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

  private

  def get_mock_details
    {
        "investments" => [
            {
                "project" => "Test project",
                "investment_date" => "2014-03-07",
                "amount" => 1000.57,
                "is_refunded" => "N",
                "is_cfp_fee_refunded" => "N",
                "is_reversed" => "NO",
                "can_reverse" => "NO",
            }
        ]
    }
  end
end
