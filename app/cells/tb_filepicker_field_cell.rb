class TbFilepickerFieldCell < Cell::Rails

  def show(opts = {})
    @form = opts[:form]
    @field = opts[:field]
    @label = opts[:label]
    render
  end
end
