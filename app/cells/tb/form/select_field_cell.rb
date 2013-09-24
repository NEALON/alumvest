class Tb::Form::SelectFieldCell < Cell::Rails

  def display(opts = {})
    @form = opts[:form]
    @field = opts[:field]
    @values = opts[:values]
    @label = opts[:label] || @field.to_s.humanize.capitalize
    render
  end
end
