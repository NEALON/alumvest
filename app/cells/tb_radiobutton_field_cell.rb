class TbRadiobuttonFieldCell < Cell::Rails

  def show(opts)
    @form = opts[:form]
    @field = opts[:field]
    @values = opts[:values]
    render
  end
end
