class TesterDashboardController < ApplicationController
  def index
    @test_users = Alumvest::UserBase.where(:middle_name => 'Test')
  end

  def reset_database
    %x[rake db:seed]
    redirect_to tester_dashboard_path
  end

  def promote_income_verifications
    Veritax::OrderBase.drafted.map(&:submit!)
    Veritax::OrderBase.submitted.map(&:complete!)
    redirect_to tester_dashboard_path
  end
end
