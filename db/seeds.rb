require_relative '../spec/support/features/factory_helpers'
require 'factory_girl_rails'

ActiveRecord::Base.establish_connection
ActiveRecord::Base.connection.tables.each do |table|
  next if table == 'schema_migrations'
  ActiveRecord::Base.connection.execute("TRUNCATE #{table}")
end

include Features::FactoryHelpers

create_accredited_investor
create_admin
create_issuer
create_publishable_campaign(@user.issuer)

create_issuer_and_live_campaign