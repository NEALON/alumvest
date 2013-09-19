class TbSelectFieldCell < Cell::Rails

  def show(opts)
    @form = opts[:form]
    @field = opts[:field]
    @values = opts[:values]
    @label = opts[:label] || @field.to_s.humanize.capitalize
    render
  end
end
