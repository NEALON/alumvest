require 'active_support/concern'

module Bancbox::EscrowTalksToBancbox
  extend ActiveSupport::Concern

  included do
    def open_account!
      return false unless self.valid?
      return true if self.open?
      create_reference_id!
      options = {
          :name => name,
          :issuer_id => issuer.bancbox_id,
          # in case the we are already behind start date
          :start_date => [start_date, Date.today].max.to_s,
          :close_date => close_date.to_s,
          :funding_goal => funding_goal,
          :created_by => issuer.name,
          :minimum_funding_amount => minimum_funding_amount,
          :maximum_funding_amount => maximum_funding_amount,
          :securities_offered => securities_offered,
          :issuer_signatory_name => issuer_signatory_name,
          :issuer_signatory_email => issuer_signatory_email,
          :issuer_signatory_title => issuer_signatory_title,
          :platform_signatory_name => 'Lynn Chen',
          :platform_signatory_email => 'kyle@alumvest.com',
          :platform_signatory_title => 'CEO'
      }
      options[:over_funding_amount] = over_funding_amount unless over_funding_amount.blank?
      begin
        ret = BancBoxCrowd.create_escrow options
        self.bancbox_id = ret['id']
        self.status = ret['status']
        self.current_balance = ret['current_balance']
        self.total_funding = ret['total_funding']
        save
        fire_bancbox_status_event(:submit_open)
        return true
        # rescue BancBoxCrowd::Error => e
        #   e
      end
    end

    def close_account!
      options = {
          :escrow_id => bancbox_id,
          :reason => 'Closed by Alumvest admin'
      }
      return BancBoxCrowd.close_escrow options
    end

    def cancel!
      options = {
          :escrow_id => bancbox_id,
          :reason => 'Canceled by Alumvest admin'
      }
      return BancBoxCrowd.cancel_escrow options
    end

    def get_details
      options = {
          :escrow_id => bancbox_id
      }
      return BancBoxCrowd.get_escrow_details(options)
    end

    def get_activity
      options = {
          :escrow_id => bancbox_id
      }
      return BancBoxCrowd.get_escrow_activity options
    end

    def fund!(investor, amount)
      raise "Escrow account #{bancbox_id} is not opened" unless self.opened?
      raise 'Invalid investment amount' if amount < minimum_funding_amount or amount > maximum_funding_amount

      bancbox_investor = investor.bancbox_investor
      bank_account = investor.user.bank_account
      options = {
          :escrow_id => bancbox_id,
          :investor_id => bancbox_investor.bancbox_id,
          :amount => amount,
          :bank_account_number => bank_account.bank_account_number,
          :bank_account_type => bank_account.bank_account_type,
          :bank_account_holder => bank_account.bank_account_holder,
          :bank_account_routing => bank_account.bank_account_routing,
          :text => 'I authorize BancBox to make this transaction',
          :fund_on_availability => true,
          :client_ip_address => server_ip,
          :submit_timestamp => current_timestamp
      }
      begin
        BancBoxCrowd.fund_escrow options
      rescue BancBoxCrowd::Error => e
        e
      end
    end

    def refund!(investor)
      return false unless self.opened?
      # TODO we should check ourselves that this investor has indeed invested first
      options = {
          :escrow_id => bancbox_id,
          :investor_id => investor.bancbox_id
      }
      begin
        BancBoxCrowd.change_investor_contribution options
        return true
      rescue BancBoxCrowd::Error => e
        e
      end
    end

    def update_from_server!
      ret = get_details
      status = ret['status']
      current_balance = ret['current_balance']
      total_funding = ret['notional_balance']
      save
      if status == Bancbox::EscrowBase::BANCBOX_STATUS_OPEN
        unless open?
          # major side effect, calls for its own class, or method in CampaignBase or something
          opened!
          campaign.created_escrow!
          campaign.go_live!
        end
      end
    end

    def update_on_server!
      options = {
          :escrow_id => bancbox_id,
          :close_date => close_date,
          :over_funding_amount => over_funding_amount,
          :funding_goal => funding_goal
      }

      begin
        BancBoxCrowd.update_escrow_account options
        return true
      rescue BancBoxCrowd::Error => e
        e
      end
    end
  end
end