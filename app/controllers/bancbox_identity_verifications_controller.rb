class BancboxIdentityVerificationsController < ApplicationController
  def show
    @user = User.find_by_id(params[:user_id])
    @bancbox_identity_verification = @user.bancbox_identity_verification || Bancbox::IdentityVerification.create(:user => @user)
  end

  def edit
    @user = User.find_by_id(params[:user_id])
    @bancbox_identity_verification = @user.bancbox_identity_verification
  end
  
  def update
    @user = User.find(params[:user_id])
    @bancbox_identity_verification = @user.bancbox_identity_verification
    @bancbox_identity_verification.update_attributes(params[:bancbox_identity_verification])
    if @bancbox_identity_verification.valid?
      redirect_to user_bancbox_identity_verification_path(@user), :flash => {:success => 'Bancbox identity verification info saved.' }
    else
      render :edit
    end
  end
end
