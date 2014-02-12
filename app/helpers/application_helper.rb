module ApplicationHelper

  def link_to_campaign_investment(investor, campaign)
    if investor.invested_in?(@campaign)
      link_to 'Manage Investment', campaign_investment_path(@campaign, investor.investments.find_by_campaign_id(@campaign.id)), :class => "btn invest-now", :method => :get
    else
      link_to 'Invest Now', new_campaign_investment_path(@company.campaign), :class => "btn invest-now", :method => :get
    end
  end

  def link_to_show_or_new(entity, heading, show_path, new_path)
    if entity.blank?
      link_to heading, show_path
    else
      link_to heading, new_path
    end
  end

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
