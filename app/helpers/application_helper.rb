module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def ownership_structures
    [
      'Sole Proprietorship',
      'General Partnership',
      'Limited Partnership',
      'Limited Liability Partnership',
      'Limited Liability Company (LLC)',
      'Corporation',
      'Nonprofit Corporation'
    ]
  end
end
