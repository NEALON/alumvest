class TbFilepickerFieldCell < Cell::Rails

  def show(opts = {})
    @form = opts[:form]
    @field = opts[:field]
    @label = opts[:label]
    @type = opts[:type] || "default"
    render
  end
end
