class BancboxAgreementsController < ApplicationController
  def show
    @user = User.find_by_id(params[:user_id])
    @bancbox_agreement = @user.bancbox_agreement || BancboxAgreement.create(:user => @user)
  end

  def edit
    @user = User.find_by_id(params[:user_id])
    @bancbox_agreement = @user.bancbox_agreement
  end
  
  def update
    @user = User.find(params[:user_id])
    @bancbox_agreement = @user.bancbox_agreement
    @bancbox_agreement.update_attributes(params[:bancbox_agreement])
    if @bancbox_agreement.valid?
      redirect_to user_bancbox_agreement_path(@user), :flash => {:success => 'Bancbox agreement info saved.' }
    else
      render :edit
    end
  end
end
