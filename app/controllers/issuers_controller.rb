class IssuersController < ApplicationController

  def edit
    @user = UserBase.find(params[:user_id])
    @issuer = @user.issuer
    render :layout => 'issuers'
  end

  def update
    @user = UserBase.find(params[:user_id])
    @issuer = @user.issuer
    @issuer.update_attributes(params[:alumvest_issuer_base])
    if @issuer.valid?
      redirect_to user_issuer_path(@user), :flash => {:success => 'Issuer info saved.'}
    else
      render :edit
    end
  end

  def show
    @user = UserBase.find(params[:user_id])
    @issuer = @user.issuer || Alumvest::Issuer::Base.new(:user => @user)
    render :layout => 'issuers'
  end
end