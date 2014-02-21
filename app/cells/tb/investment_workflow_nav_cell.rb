class Tb::InvestmentWorkflowNavCell < Cell::Rails

  def display(opts)
    @steps = opts[:steps]
    @active = opts[:active]
    render
  end
end
