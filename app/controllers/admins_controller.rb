class AdminsController < ApplicationController
  include VeritaxOrders # for simulating responses

  def show
    @user = UserBase.find(params[:user_id])
    render :layout => 'admins'
  end

  def campaign_events
    @user = UserBase.find(params[:user_id])
    @events = Bus::Event.find_by_sql("
      select * from bus_events
      where type = 'Bus::Event::Campaign::Published'
      or type = 'Bus::Event::Campaign::WentLive'
      or type = 'Bus::Event::Campaign::Rejected'
      order by id desc")

    render :layout => 'admins'
  end

  def income_verification_events
    @user = UserBase.find(params[:user_id])
    # TODO: merging and sorting these events
    # TODO: event filtering
    @events = Bus::Event.find_by_sql("
      select * from bus_events
      where type = 'Bus::Event::VeritaxEvent::OrderSubmittedSuccessfully'
      or type = 'Bus::Event::VeritaxEvent::OrderCompleted'
      or type = 'Bus::Event::VeritaxEvent::OrderCanceled'
      order by id desc")
    render :layout => 'admins'
  end

  def investor_signings
    @user = UserBase.find(params[:user_id])
    @investor_signings = SigningBase.signed_by_investor
    render :layout => 'admins'
  end

  def simulate_completed_order
    order = Veritax::Order::Base.find(params[:veritax_order_id])
    order.update_attribute(:vt_order_id, CompletedOrderId)
    order.get_order_info!

    redirect_to income_verification_events_user_admin_path(current_user)
  end

  def simulate_canceled_order
    order = Veritax::Order::Base.find(params[:veritax_order_id])
    order.update_attribute(:vt_order_id, CanceledOrderId)
    order.get_order_info!

    redirect_to income_verification_events_user_admin_path(current_user)
  end

  def income_verification_transcript
    order = Veritax::Order::Base.find(params[:veritax_order_id])
    send_data Base64.decode64(order.vt_transcript), :filename => 'transcript.pdf', :type => 'application/pdf'
  end

  def approve_investor_signing
    if Bus::Event::SigningApproved.create(
        :signing => SigningBase.find(params[:signing]),
        :admin => UserBase.find(params[:admin])
    )
      redirect_to investor_signings_user_admin_path(current_user), :flash => {:success => 'Signing approved.'}
    else
      redirect_to investor_signings_user_admin_path(current_user), :flash => {:warning => 'Could not approve signing.'}
    end
  end

  def reject_investor_signing
    if Bus::Event::SigningRejected.create(
        :signing => SigningBase.find(params[:signing]),
        :admin => UserBase.find(params[:admin])
    )
      redirect_to  investor_signings_user_admin_path(current_user), :flash => {:success => 'Signing rejected.'}
    else
      redirect_to investor_signings_user_admin_path(current_user), :flash => {:warning => 'Could not reject signing.'}
    end
  end
end