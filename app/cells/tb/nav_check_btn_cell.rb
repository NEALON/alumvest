class Tb::NavCheckBtnCell < Cell::Rails

  def display(opts)
    @label = opts[:label]
    @checked = opts[:checked]
    @enabled = opts[:enabled]
    @active = opts[:active]
    @link = opts[:link]
    render
  end
end
