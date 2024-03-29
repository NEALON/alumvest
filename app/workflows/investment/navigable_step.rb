class NavigableStep
  include Rails.application.routes.url_helpers

  abstract_method :label
  abstract_method :checked?
  abstract_method :enabled?
  abstract_method :active?
  abstract_method :link

  def initialize(investment)
    @investment = investment
    @campaign = @investment.try(:campaign)
    @payment = @investment.try(:payment)
  end

  def render(active)
    ApplicationController.new.render_cell(
        'tb/nav_check_btn',
        :display,
        :label => label,
        :checked => checked?,
        :enabled => enabled?,
        :active => active?(active),
        :link => link)
  end
end

