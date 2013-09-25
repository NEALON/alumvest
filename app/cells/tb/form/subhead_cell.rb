class Tb::Form::SubheadCell < Cell::Rails

  def display(opts = {})
    @label = opts[:label] || "Section Heading"
    render
  end
end
