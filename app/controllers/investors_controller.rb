class InvestorsController < ApplicationController

  def edit
    @user = User.find(params[:user_id])
    @investor = @user.investor
    render :layout => "investors"
  end

  def update
    @user = User.find(params[:user_id])
    @investor = @user.investor
    @investor.update_attributes(params[:investor])
    if @investor.valid?
      redirect_to user_investor_path(@user), :flash => {:success => 'Investor info saved.' }
    else
      render :edit
    end
  end

  #def check_for_completeness
  #  @user = User.find(params[:user_id])
  #  @investor = @user.investor
  #  @investor.update_attributes(params[:investor])
  #  if @investor.make_ready_for_review
  #    redirect_to user_investor_path(@user), :flash => {:success => 'Investor info is complete.' }
  #  else
  #    render :new, :error => 'Correct the data to make this complete.'
  #  end
  #end

  def show
    @user = User.find(params[:user_id])
    @investor = @user.investor || Investor.new(:user => @user)
    render :layout => "investors"
  end

  #def display
  #  @user = User.find(params[:user_id])
  #  @investor = @user.investor
  #end
end

