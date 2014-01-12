class Tb::Form::TextCell  < Cell::Rails

  def display(opts = {})
    @form = opts[:form]
    @field = opts[:field]
    @placeholder = opts[:placeholder] || ""

    render
  end
end
