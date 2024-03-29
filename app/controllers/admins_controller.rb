class AdminsController < ApplicationController
  include VeritaxOrders # for simulating responses

  def show
    @user = Alumvest::UserBase.find(params[:user_id])
    render :layout => 'admins'
  end

  def campaign_events
    @user = Alumvest::UserBase.find(params[:user_id])
    @events = Bus::Event.find_by_sql("
      select * from bus_events
      where type = 'Bus::Event::Campaign::Published'
      or type = 'Bus::Event::Campaign::Accepted'
      or type = 'Bus::Event::Campaign::Rejected'
      or type = 'Bus::Event::Investment::Funded'
      order by id desc")

    render :layout => 'admins'
  end

  def income_verification_events
    @user = Alumvest::UserBase.find(params[:user_id])
    # TODO: merging and sorting these events
    # TODO: event filtering
    @events = Bus::Event.find_by_sql("
      select * from bus_events
      where type = 'Bus::Event::VeritaxOrder::SubmittedSuccessfully'
      or type = 'Bus::Event::VeritaxOrder::Completed'
      or type = 'Bus::Event::VeritaxOrder::Canceled'
      or type = 'Bus::Event::VeritaxOrder::Approved'
      or type = 'Bus::Event::VeritaxOrder::Rejected'
      order by id desc")
    render :layout => 'admins'
  end

  def investor_signings
    @user = Alumvest::UserBase.find(params[:user_id])
    @investor_signings = Alumvest::SigningBase.signed_by_investor
    render :layout => 'admins'
  end

  def simulate_completed_order
    order = Veritax::OrderBase.find(params[:veritax_order_id])
    order.update_attribute(:vt_order_id, CompletedOrderId)
    order.get_order_info!

    redirect_to income_verification_events_user_admin_path(current_user)
  end

  def simulate_canceled_order
    order = Veritax::OrderBase.find(params[:veritax_order_id])
    order.update_attribute(:vt_order_id, CanceledOrderId)
    order.get_order_info!

    redirect_to income_verification_events_user_admin_path(current_user)
  end
  def completed_order
    order = Veritax::OrderBase.find(params[:veritax_order_id])
    status = order.get_order_info!
    redirect_to income_verification_events_user_admin_path(current_user),:flash => {:success => status}
  end

  def cancel_order
    order = Veritax::OrderBase.find(params[:veritax_order_id])
     status = order.get_order_info!
    redirect_to income_verification_events_user_admin_path(current_user),:flash => {:success => status}
  end
  
  
  def income_verification_transcript
    order = Veritax::OrderBase.find(params[:veritax_order_id])
    send_data Base64.decode64(order.vt_transcript), :filename => 'transcript.pdf', :type => 'application/pdf'
  end

  def approve_investor_signing
    if Bus::Event::Investment::Signing::Approved.create(
        :signing => Alumvest::SigningBase.find(params[:signing]),
        :admin => Alumvest::UserBase.find(params[:admin])
    )
      signing.accept_investor_signature!
      redirect_to investor_signings_user_admin_path(current_user), :flash => {:success => 'Signing approved.'}
    else
      redirect_to investor_signings_user_admin_path(current_user), :flash => {:warning => 'Could not approve signing.'}
    end
  end

  def reject_investor_signing
    signing = Alumvest::SigningBase.find(params[:signing])
    admin = Alumvest::UserBase.find(params[:admin])
    investor = Alumvest::InvestorBase.find(params[:investor])
    if Bus::Event::Investment::Signing::Rejected.create(
        :signing => signing,
        :admin => admin,
        :investor => investor
    )
      signing.envelopes.last.void!
      signing.reject_investor_signature!
      redirect_to  investor_signings_user_admin_path(current_user), :flash => {:success => 'Signing rejected.'}
    else
      redirect_to investor_signings_user_admin_path(current_user), :flash => {:warning => 'Could not reject signing.'}
    end
  end

  def approve_income_verification
    order = Veritax::OrderBase.find(params[:income_verification_id])
    order.approve!
    redirect_to income_verification_events_user_admin_path(current_user), :flash => {:success => 'Accredited investor income approved.'}
  end

  def reject_income_verification
    order = Veritax::OrderBase.find(params[:income_verification_id])
    order.reject!
    redirect_to income_verification_events_user_admin_path(current_user), :flash => {:success => 'Accredited investor income rejected.'}
  end

  def disable_campaign
    campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    campaign.disable!
    redirect_to display_campaign_company_path(campaign), :flash => {:success => 'Successfully disabled this campaign.'}
  end

  def enable_campaign
    campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    campaign.enable!
    redirect_to display_campaign_company_path(campaign), :flash => {:success => 'Successfully disabled this campaign.'}
  end

  def close_campaign
    campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    campaign.close!
    redirect_to display_campaign_company_path(campaign), :flash => {:success => 'Successfully closed this campaign.'}
  end

  def cancel_campaign
    campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    campaign.cancel!
    redirect_to display_campaign_company_path(campaign), :flash => {:success => 'Successfully canceled this campaign.'}
  end

  def bancbox_investments
    @user = current_user
    @investor = Alumvest::InvestorBase.find(params[:investor_id])
    @investments = @investor.bancbox_investor.refresh_investments
    render :layout => 'admins'
  end

  def escrow_account
    @user = current_user
    @campaign = Alumvest::CampaignBase.find(params[:campaign_id])
    @escrow_account = @campaign.bancbox_escrow
    render :layout => 'admins'
  end

  def update_escrow_account
    @user = current_user
    @escrow_account = Bancbox::EscrowBase.find(params[:escrow_account_id])
    @campaign = @escrow_account.campaign

    Bancbox::EscrowBase.transaction do
      @escrow_account.update_attributes(params[:bancbox_escrow_base])
      @escrow_account.update_on_server!
    end

    redirect_to display_campaign_company_path(@campaign), :flash => {:success => 'Successfully updated escrow account.'}
  end
end