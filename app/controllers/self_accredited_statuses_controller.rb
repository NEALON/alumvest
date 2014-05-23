class SelfAccreditedStatusesController < ApplicationController

  def new
    @user = Alumvest::UserBase.find(params[:user_id])
    unless @user.finishes_self_accredited_form?
      @investor = @user.investor
      @self_accredited_status = Alumvest::SelfAccreditedStatus.new(investor: @investor)
      authorize! :manage, @self_accredited_status
    else
      redirect_to user_investor_self_accredited_status_path(@user)
    end
  end

  def create
    @user = Alumvest::UserBase.find(params[:user_id])
    @investor = @user.investor
    @self_accredited_status = Alumvest::SelfAccreditedStatus.create(params[:alumvest_self_accredited_status])
    authorize! :manage, @self_accredited_status
    if @self_accredited_status.valid?
      @investor.update_attributes(:accredited_investor_status => 'self')
      redirect_to user_investor_self_accredited_status_path(@user)
    else
      render :action => :new
    end
  end

  def edit
    load_self_accredited_status
    authorize! :manage, @self_accredited_status
    render action: :show
  end

  def update
    load_self_accredited_status
    authorize! :manage, @self_accredited_status
    render action: :show
  end

  def show
    if load_self_accredited_status
      authorize! :manage, @self_accredited_status
    else
      redirect_to new_user_investor_self_accredited_status_path(@user)
    end
  end

  private

  def load_self_accredited_status
    @user = Alumvest::UserBase.find(params[:user_id])
    @investor = @user.investor
    @self_accredited_status =  @investor.self_accredited_status
    if @self_accredited_status.nil?
      return false
    else
      return true
    end
  end
end

