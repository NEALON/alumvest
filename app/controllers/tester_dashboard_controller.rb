class TesterDashboardController < ApplicationController
  def index
    @test_users = UserBase.where(:middle_name => 'Test')
  end

  def reset_database
    %x[rake db:seed]
    redirect_to tester_dashboard_path
  end

  def promote_income_verifications
    Veritax::Order::Base.drafted.map(&:submit!)
    Veritax::Order::Base.submitted.map(&:complete!)
    redirect_to tester_dashboard_path
  end
end
