class Tb::MiniLinkButtonCell < Cell::Rails

  def display(opts = {})
    @label = opts[:label]
    @link = opts[:link]
    @new_page = opts[:new_page]
    render
  end
end
