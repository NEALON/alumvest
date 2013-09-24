class Tb::Form::TextFieldCell < Cell::Rails

  def display(opts = {})
    @form = opts[:form]
    @field = opts[:field]

    render
  end
end
