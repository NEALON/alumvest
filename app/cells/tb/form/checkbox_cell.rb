class Tb::Form::CheckboxCell  < Cell::Rails

  def display(opts = {})
    @form = opts[:form]
    @field = opts[:field]
    @label = opts[:label] || @field
    render
  end
end