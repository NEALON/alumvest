class Tb::MiniLinkButtonCell < Cell::Rails

  def display(opts = {})
    @label = opts[:label]
    @link = opts[:link]
    render
  end
end
