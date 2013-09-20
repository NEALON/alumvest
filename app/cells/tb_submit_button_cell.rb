class TbSubmitButtonCell < Cell::Rails

  def show(opts = {})
    @label = opts[:label] || "Save"
    render
  end
end