class Tb::Form::FilepickerCell < Cell::Rails

  def display(opts = {})
    @form = opts[:form]
    @field = opts[:field]
    @label = opts[:label]
    @type = opts[:type] || "default"
    render
  end
end
