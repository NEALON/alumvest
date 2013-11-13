class InvestorsController < ApplicationController

  #def new
  #  @user = User.find(params[:user_id])
  #  @investor = Investor.new(:user => @user)
  #end

  #def create
  #  @user = User.find(params[:user_id])
  #  @investor = Investor.create(add_images_if_test!(params[:investor]))
  #  if @investor.valid?
  #    redirect_to user_investor_path(@user), :flash => {:success => 'Investor saved.' }
  #  else
  #    render :action => :new
  #  end
  #end

  def edit
    @user = User.find(params[:user_id])
    @investor = @user.investor
    render :new
  end

  def update
    @user = User.find(params[:user_id])
    @investor = @user.investor
    @investor.update_attributes(add_images_if_test!(params[:investor]))
    if @investor.valid?
      redirect_to edit_user_path(@user) + "?tab=investor_profile", :flash => {:success => 'Investor info saved.' }
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
    @investor = @user.investor
  end

  #def display
  #  @user = User.find(params[:user_id])
  #  @investor = @user.investor
  #end

  private

  def add_images_if_test!(params)
  #  if Rails.env.test?
  #    params[:logo_url] = 'http://placehold.it/100x100'
  #    params[:photo_url] = 'http://placehold.it/300x150'
  #    params[:banner_photo_url] = 'http://placehold.it/1500x400'
  #
      params
  #  else
  #    params
  #  end
  end
end

