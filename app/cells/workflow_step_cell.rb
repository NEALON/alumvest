class WorkflowStepCell < Cell::Rails

  def display(opts = {})
    @label = opts[:label]
    @description = opts[:description]
    @link = opts[:link]
    @status = opts[:status] || 'Pending'
    render
  end
end
