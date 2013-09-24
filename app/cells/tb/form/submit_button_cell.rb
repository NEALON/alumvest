class Tb::Form::SubmitButtonCell < Cell::Rails

  def display(opts = {})
    @label = opts[:label] || "Save"
    render
  end
end