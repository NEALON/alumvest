class TbMiniLinkButtonCell < Cell::Rails

  def show(opts = {})
    @label = opts[:label]
    @link = opts[:link]
    render
  end
end
