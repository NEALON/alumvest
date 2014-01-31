class InvestorsController < ApplicationController

  def edit
    @user = Alumvest::User::Base.find(params[:user_id])
    @investor = @user.investor
    render :layout => "investors"
  end

  def update
    @user = Alumvest::User::Base.find(params[:user_id])
    @investor = @user.investor
    @investor.update_attributes(params[:alumvest_investor_base])
    if @investor.valid?
      redirect_to user_investor_path(@user), :flash => {:success => 'Investor info saved.' }
    else
      render :edit
    end
  end

  #def check_for_completeness
  #  @user = Alumvest::User::Base.find(params[:user_id])
  #  @investor = @user.investor
  #  @investor.update_attributes(params[:alumvest_investor_base])
  #  if @investor.make_ready_for_review
  #    redirect_to user_investor_path(@user), :flash => {:success => 'Investor info is complete.' }
  #  else
  #    render :new, :error => 'Correct the data to make this complete.'
  #  end
  #end

  def show
    @user = Alumvest::User::Base.find(params[:user_id])
    @investor = @user.investor || Alumvest::Investor::Base.new(:user => @user)
    render :layout => "investors"
  end

  #def display
  #  @user = Alumvest::User::Base.find(params[:user_id])
  #  @investor = @user.investor
  #end
end

