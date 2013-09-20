class TbRichtextFieldCell < Cell::Rails

  def show(opts = {})
    @form = opts[:form]
    @field = opts[:field]
    @label = opts[:label] || @field.to_s.humanize.capitalize

    render
  end
end
