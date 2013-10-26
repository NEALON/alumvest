class Tb::Form::DateselectCell  < Cell::Rails

  def display(opts = {})
    @form = opts[:form]
    @field = opts[:field]

    render
  end
end