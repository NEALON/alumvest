class Tb::Form::HelptextCell < Cell::Rails

  def display(opts = {})
    @text = opts[:text] || "Pending: Help text"
    render
  end
end
