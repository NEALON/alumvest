class TbTextFieldCell < Cell::Rails

  def show(opts)
    @form = opts[:form]
    @field = opts[:field]
    render
  end
end
