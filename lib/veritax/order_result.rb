class Veritax::OrderResult
  attr_reader :message, :order_id

  def initialize(opts)
    @code = opts[:error_code]
    @message = opts[:error_message]
    @order_id = opts[:order_id]
  end

  def success?
    @code == 'Success'
  end
end