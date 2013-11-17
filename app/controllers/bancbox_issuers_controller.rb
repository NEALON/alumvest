class BancboxIssuersController < ApplicationController
  def show
    @user = User.find_by_id(params[:user_id])
    @bancbox_issuer = @user.bancbox_issuer || BancboxIssuer.create(:user => @user)
  end

  def edit
    @user = User.find_by_id(params[:user_id])
    @bancbox_issuer = @user.bancbox_issuer
  end

  def update
    @user = User.find(params[:user_id])
    @bancbox_issuer = @user.bancbox_issuer
    @bancbox_issuer.update_attributes(params[:bancbox_issuer])
    if @bancbox_issuer.valid?
      unless @bancbox_issuer.submitted?
        @bancbox_issuer.submit!
      end
      redirect_to user_bancbox_issuer_path(@user), :flash => {:success => 'Bancbox issuer info saved.' }
    else
      render :edit
    end
  end
end
