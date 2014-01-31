class TesterDashboardController < ApplicationController
  def index
    @test_users = Alumvest::User::Base.where(:middle_name => 'Test')
  end

  def reset_database
    %x[rake db:seed]
    redirect_to tester_dashboard_path, :flash => {:success => 'Database has been reset.'}
  end
end
