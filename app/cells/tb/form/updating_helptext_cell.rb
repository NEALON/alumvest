class Tb::Form::UpdatingHelptextCell < Cell::Rails

  def display(opts = {})
    @text = opts[:text] || "Pending: Help text"
    @id = opts[:id]
    render
  end
end