class InvestorsController < ApplicationController

  def edit
    @user = Alumvest::UserBase.find(params[:user_id])
    @investor = @user.investor
    authorize! :manage, @investor
  end

  def update
    @user = Alumvest::UserBase.find(params[:user_id])
    @investor = @user.investor
    authorize! :manage, @investor
    @investor.update_attributes(params[:alumvest_investor_base])
    if @investor.valid?
      redirect_to edit_user_investor_path(@user), :flash => {:success => 'Investor info saved.'}
    else
      render :edit
    end
  end

  def show
    @user = Alumvest::UserBase.find(params[:user_id])
    @investor = @user.investor || Alumvest::InvestorBase.new(:user => @user)
    authorize! :read, @investor
  end

  def dashboard
    @user = Alumvest::UserBase.find(params[:user_id])
    @user.educations.build if @user.educations.blank?
    @investor = @user.investor || Alumvest::InvestorBase.new(:user => @user)
    @events = @investor.events.order('id DESC')
    authorize! :read, @investor
  end

  #def display
  #  @user = Alumvest::UserBase.find(params[:user_id])
  #  @investor = @user.investor
  #end
  #
  #def check_for_completeness
  #  @user = Alumvest::UserBase.find(params[:user_id])
  #  @investor = @user.investor
  #  @investor.update_attributes(params[:alumvest_investor_base])
  #  if @investor.make_ready_for_review
  #    redirect_to user_investor_path(@user), :flash => {:success => 'Investor info is complete.'}
  #  else
  #    render :new, :error => 'Correct the data to make this complete.'
  #  end
  #end
end

