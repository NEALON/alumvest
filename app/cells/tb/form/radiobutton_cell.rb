class Tb::Form::RadiobuttonCell < Cell::Rails

  def display(opts = {})
    @form = opts[:form]
    @field = opts[:field]
    @values = opts[:values]
    render
  end
end
