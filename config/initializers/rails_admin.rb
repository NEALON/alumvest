# RailsAdmin config file. Generated on July 18, 2013 14:50
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|


  ################  Global configuration  ################

  # Set the admin name here (optional second array element will appear in red). For example:
  config.main_app_name = ['Av', 'Data']
  # or for a more dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }

  # RailsAdmin may need a way to know who the current user is]
  config.current_user_method { current_user } # auto-generated
  config.authenticate_with {}
  config.authorize_with do
    if Rails.env.production?
      is_admin = (ADMIN_EMAILS.include?(current_user.email) or current_user.is_admin?) if current_user
      redirect_to main_app.root_url unless is_admin
    end
  end

  ADMIN_EMAILS = ['interskh@gmail.com', 'mikepence@gmail.com', 'kyle@alumvest.com', 'lynn@alumvest.com', 'lynnduke@gmail.com', 'chinesecode@gmail.com', 'daniel.yang625@gmail.com', 'sasha.ablovatskiy@gmail.com']

  # If you want to track changes on your models:
  # config.audit_with :history

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20
end
