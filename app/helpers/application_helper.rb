module ApplicationHelper

  def link_to_campaign_investment(investor, campaign)
    if investor.invested_in?(@campaign)
      link_to 'Manage Investment', campaign_investment_path(@campaign, investor.investments.find_by_campaign_id(@campaign.id)), :class => "btn btn-primary btn-lg upper btn-block", :method => :get
    else
      link_to 'Invest now', new_campaign_investment_path(@company.campaign), :class => "btn btn-primary btn-lg upper btn-block", :method => :get
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

  def payment_link(campaign, investment, funding_xn)

    if funding_xn
      campaign_investment_funding_xn_path(campaign, investment, funding_xn)
    else
      unless investment.new_record?
        new_campaign_investment_funding_xn_path(campaign, investment)
      else
        '#'
      end
    end
  end
  
  def income_verification_link_simple(label)
    if current_user.investor.income_verification.nil?      
      link_to new_user_investor_income_verification_path(current_user) do
        label
      end
    else
      link_to user_investor_income_verification_path(current_user) do
        label
      end
    end
  end

  def income_verification_link(label)
    if current_user.investor.income_verification.nil?      
      link_to new_user_investor_income_verification_path(current_user) do
        content_tag(:i, "", class: "fa fa-file-text fa-fw").html_safe + ' ' + ('<span class="hidden-xs">' + label + '</span>').html_safe
      end
    else
      link_to user_investor_income_verification_path(current_user) do
        content_tag(:i, "", class: "fa fa-file-text fa-fw").html_safe + ' ' + ('<span class="hidden-xs">' + label + '</span>').html_safe
      end
    end
  end

  def user_profile_entry_link(user, edit=false)
    if user.is_investor? and not user.finishes_self_accredited_form?
      return new_user_investor_self_accredited_status_path(user)
    else
      if edit
        return edit_user_path(user)
      else
        return user_path(user)
      end
    end
  end
end
