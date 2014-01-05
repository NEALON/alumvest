class Veritax::OrderInfo
  attr_reader :status, :order_completed_date, :problem_description

  def initialize(opts)
    @code = opts[:error_code]
    if opts[:order_detail]
      @status = opts[:order_detail][:status]
      @order_completed_date = opts[:order_detail][:order_completed_date]
      @problem_description = opts[:order_detail][:problem_description]
    end
  end

  def success?
    @code == 'Success'
  end
end