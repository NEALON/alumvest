class Tb::Form::FilepickerFieldCell < Cell::Rails

  def display(opts = {})
    @form = opts[:form]
    @field = opts[:field]
    @label = opts[:label]
    render
  end
end
