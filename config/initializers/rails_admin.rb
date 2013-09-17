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
      is_admin = ADMIN_EMAILS.include?(current_user.email) if current_user
      redirect_to main_app.root_url unless is_admin
    end
  end

  ADMIN_EMAILS = ['interskh@gmail.com', 'mikepence@gmail.com', 'kyle@alumvest.com', 'lynn@alumvest.com', 'lynnduke@gmail.com', 'chinesecode@gmail.com', 'daniel.yang625@gmail.com', 'sasha.ablovatskiy@gmail.com']

  # If you want to track changes on your models:
  config.audit_with :history

  # Or with a PaperTrail: (you need to install it first)
  config.audit_with :paper_trail

  # Display empty fields in show views:
  # config.compact_show_view = false

  # Number of default rows per-page:
  # config.default_items_per_page = 20

  # Exclude specific models (keep the others):
  # config.excluded_models = ['Borrower', 'BorrowerCredit', 'BorrowerProfile', 'Coupon', 'Investor', 'Loan', 'Order', 'Portfolio', 'User']

  # Include specific models (exclude the others):
  # config.included_models = ['Borrower', 'BorrowerCredit', 'BorrowerProfile', 'Coupon', 'Investor', 'Loan', 'Order', 'Portfolio', 'User']

  # Label methods for model instances:
  # config.label_methods << :description # Default is [:name, :title]


  ################  Model configuration  ################

  # Each model configuration can alternatively:
  #   - stay here in a `config.model 'ModelName' do ... end` block
  #   - go in the model definition file in a `rails_admin do ... end` block

  # This is your choice to make:
  #   - This initializer is loaded once at startup (modifications will show up when restarting the application) but all RailsAdmin configuration would stay in one place.
  #   - Models are reloaded at each request in development mode (when modified), which may smooth your RailsAdmin development workflow.


  # Now you probably need to tour the wiki a bit: https://github.com/sferik/rails_admin/wiki
  # Anyway, here is how RailsAdmin saw your application's models when you ran the initializer:



  ###  Borrower  ###

  # config.model 'Borrower' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your borrower.rb model definition

  #   # Found associations:

  #     configure :user, :belongs_to_association 
  #     configure :versions, :has_many_association         # Hidden 
  #     configure :loans, :has_many_association 
  #     configure :borrower_profile, :has_one_association 
  #     configure :borrower_credit, :has_one_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :first_name, :string 
  #     configure :last_name, :string 
  #     configure :street_address, :string 
  #     configure :state, :string 
  #     configure :postal_code, :string 
  #     configure :daytime_phone, :string 
  #     configure :evening_phone, :string 
  #     configure :dob, :date 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  BorrowerCredit  ###

  # config.model 'BorrowerCredit' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your borrower_credit.rb model definition

  #   # Found associations:

  #     configure :borrower, :belongs_to_association 
  #     configure :versions, :has_many_association         # Hidden 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :score_range, :string 
  #     configure :earliest_credit_line, :date 
  #     configure :open_credit_lines, :integer 
  #     configure :total_credit_lines, :integer 
  #     configure :revolving_credit_balance, :decimal 
  #     configure :revolving_line_utilization_pct, :decimal 
  #     configure :inquiries_in_last_6_months, :integer 
  #     configure :accounts_now_delinquent, :integer 
  #     configure :delinquent_amount, :decimal 
  #     configure :delinquencies_in_last_2_years, :integer 
  #     configure :months_since_last_delinquency, :integer 
  #     configure :public_records_on_file, :integer 
  #     configure :months_since_last_public_record, :integer 
  #     configure :months_since_last_derogatory, :integer 
  #     configure :borrower_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  BorrowerProfile  ###

  # config.model 'BorrowerProfile' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your borrower_profile.rb model definition

  #   # Found associations:

  #     configure :borrower, :belongs_to_association 
  #     configure :versions, :has_many_association         # Hidden 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :home_ownership, :string 
  #     configure :current_employer, :string 
  #     configure :length_of_employment_in_months, :integer 
  #     configure :gross_monthly_income, :decimal 
  #     configure :location, :string 
  #     configure :borrower_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Coupon  ###

  # config.model 'Coupon' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your coupon.rb model definition

  #   # Found associations:

  #     configure :portfolio, :belongs_to_association 
  #     configure :loan, :belongs_to_association 
  #     configure :versions, :has_many_association         # Hidden 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :investment_amount, :decimal 
  #     configure :interest_rate, :decimal 
  #     configure :term_in_months, :integer 
  #     configure :outstanding_principal, :decimal 
  #     configure :accrued_interest, :decimal 
  #     configure :payments_received, :decimal 
  #     configure :payment_due_day, :integer 
  #     configure :portfolio_id, :integer         # Hidden 
  #     configure :loan_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Investor  ###

  # config.model 'Investor' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your investor.rb model definition

  #   # Found associations:

  #     configure :user, :belongs_to_association 
  #     configure :versions, :has_many_association         # Hidden 
  #     configure :portfolios, :has_many_association 
  #     configure :coupons, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :first_name, :string 
  #     configure :last_name, :string 
  #     configure :street_address, :string 
  #     configure :state, :string 
  #     configure :postal_code, :string 
  #     configure :daytime_phone, :string 
  #     configure :evening_phone, :string 
  #     configure :dob, :date 
  #     configure :investable_assets, :string 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Loan  ###

  # config.model 'Loan' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your loan.rb model definition

  #   # Found associations:

  #     configure :borrower, :belongs_to_association 
  #     configure :versions, :has_many_association         # Hidden 
  #     configure :coupons, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :identifier, :string 
  #     configure :amount_requested, :integer 
  #     configure :purpose, :string 
  #     configure :description, :text 
  #     configure :grade, :string 
  #     configure :interest_rate, :decimal 
  #     configure :months, :integer 
  #     configure :monthly_payment, :decimal 
  #     configure :first_payment_due_on, :date 
  #     configure :funding_received, :decimal 
  #     configure :review_status, :string 
  #     configure :loan_status, :string 
  #     configure :submitted_at, :datetime 
  #     configure :listing_expires_at, :datetime 
  #     configure :borrower_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Order  ###

  # config.model 'Order' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your order.rb model definition

  #   # Found associations:

  #     configure :investor, :belongs_to_association 
  #     configure :versions, :has_many_association         # Hidden 
  #     configure :coupons, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :order_number, :string 
  #     configure :ordered_on, :date 
  #     configure :amount, :decimal 
  #     configure :coupon_count, :integer 
  #     configure :interest_rate_weighted_avg, :decimal 
  #     configure :in_funding_amount, :decimal 
  #     configure :in_funding_coupon_count, :integer 
  #     configure :expired_amount, :decimal 
  #     configure :expired_coupon_count, :integer 
  #     configure :issued_amount, :decimal 
  #     configure :issued_coupon_count, :integer 
  #     configure :issued_interest_rate_weighted_avg, :decimal 
  #     configure :investor_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  Portfolio  ###

  # config.model 'Portfolio' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your portfolio.rb model definition

  #   # Found associations:

  #     configure :investor, :belongs_to_association 
  #     configure :versions, :has_many_association         # Hidden 
  #     configure :coupons, :has_many_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :coupon_count, :integer 
  #     configure :investment, :decimal 
  #     configure :interest_rate_weighted_avg, :decimal 
  #     configure :oustanding_principal, :decimal 
  #     configure :payments_to_date, :decimal 
  #     configure :expected_monthly_payments, :decimal 
  #     configure :investor_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end


  ###  User  ###

  # config.model 'User' do

  #   # You can copy this to a 'rails_admin do ... end' block inside your user.rb model definition

  #   # Found associations:

  #     configure :invited_by, :polymorphic_association         # Hidden 
  #     configure :versions, :has_many_association         # Hidden 
  #     configure :borrower, :has_one_association 
  #     configure :investor, :has_one_association 

  #   # Found columns:

  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :name, :string 
  #     configure :confirmation_token, :string 
  #     configure :confirmed_at, :datetime 
  #     configure :confirmation_sent_at, :datetime 
  #     configure :unconfirmed_email, :string 
  #     configure :invitation_token, :string 
  #     configure :invitation_sent_at, :datetime 
  #     configure :invitation_accepted_at, :datetime 
  #     configure :invitation_limit, :integer 
  #     configure :invited_by_id, :integer         # Hidden 
  #     configure :invited_by_type, :string         # Hidden 
  #     configure :role, :string 

  #   # Cross-section configuration:

  #     # object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #     # label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #     # label_plural 'My models'      # Same, plural
  #     # weight 0                      # Navigation priority. Bigger is higher.
  #     # parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #     # navigation_label              # Sets dropdown entry's name in navigation. Only for parents!

  #   # Section specific configuration:

  #     list do
  #       # filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #       # items_per_page 100    # Override default_items_per_page
  #       # sort_by :id           # Sort column (default is primary key)
  #       # sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     end
  #     show do; end
  #     edit do; end
  #     export do; end
  #     # also see the create, update, modal and nested sections, which override edit in specific cases (resp. when creating, updating, modifying from another model in a popup modal or modifying from another model nested form)
  #     # you can override a cross-section field configuration in any section with the same syntax `configure :field_name do ... end`
  #     # using `field` instead of `configure` will exclude all other fields and force the ordering
  # end

end
