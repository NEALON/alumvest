class Tb::Form::TextCell  < Cell::Rails

  def display(opts = {})
    @form = opts[:form]
    @field = opts[:field]
    @label = opts[:label] || @field
    @placeholder = opts[:placeholder] || ''
    @help = opts[:help] || ''

    render
  end
end
