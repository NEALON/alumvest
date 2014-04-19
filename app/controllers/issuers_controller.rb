class IssuersController < ApplicationController

  def edit
    @user = Alumvest::UserBase.find(params[:user_id])
    @issuer = @user.issuer
    authorize! :manage, @issuer
    render :layout => 'issuers'
  end

  def update
    @user = Alumvest::UserBase.find(params[:user_id])
    @issuer = @user.issuer
    authorize! :manage, @issuer
    @issuer.update_attributes(params[:alumvest_issuer_base])
    if @issuer.valid?
      redirect_to user_issuer_path(@user), :flash => {:success => 'Issuer info saved.'}
    else
      render :edit
    end
  end

  def show
    @user = Alumvest::UserBase.find(params[:user_id])
    @issuer = @user.issuer || Alumvest::IssuerBase.new(:user => @user)
    authorize! :read, @issuer
    render :layout => 'issuers'
  end
end
