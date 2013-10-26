class Tb::Form::RichtextCell < Cell::Rails

  def display(opts = {})
    @form = opts[:form]
    @field = opts[:field]
    @label = opts[:label] || @field.to_s.humanize.capitalize

    render
  end
end
