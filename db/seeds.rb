require_relative '../spec/support/features/factory_helpers'
require 'factory_girl_rails'

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end

include Features::FactoryHelpers

Category.create(:name => 'A category')

create_owner
create_live_campaign(@user.owner)

# sign_up :investor
# @investor.update_attribute :accredited_investor_status, 'approved'