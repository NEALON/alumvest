class TalksToBancbox

  def self.fund_escrow!(campaign, investment, amount)
    campaign.bancbox_escrow.fund!(investment.investor, amount)
  end

  def self.submit_investor!(user, bank_account)

    bancbox_investor = user.investor.bancbox_investor ||
        Bancbox::Investor.create(
            :investor => user.investor,
            :investor_type => 'Individual/LLC',
            :agreement => true)
    # TODO yuck, let's remove this redundancy:
    bancbox_investor.populate_fields_from_user(user)

    begin
      bancbox_investor.submit!(bank_account)
    rescue BancBoxCrowd::Error => e
      e
    end
  end

  def self.submit_issuer!(user, bank_account)

    bancbox_issuer = user.owner.bancbox_issuer ||
        Bancbox::Issuer.create(
            :owner => user.owner,
            :agreement => true)

    # TODO yuck, let's remove this redundancy:
    bancbox_issuer.populate_fields_from_user(user)

    begin
      bancbox_issuer.submit!(bank_account)
    rescue BancBoxCrowd::Error => e
      e
    end
  end

  def self.create_escrow!(user, campaign)
    Bancbox::Escrow.create(
        :issuer => user.owner.bancbox_issuer,
        :campaign => campaign,
        :name => 'Alumvest',
        :start_date => (start_date = (campaign.starts_on || Date.today)),
        :close_date => (start_date + campaign.investment_term.campaign_length.days),
        :funding_goal => campaign.investment_term.fundraising_amount,
        :minimum_funding_amount => campaign.investment_term.min_investment,
        :maximum_funding_amount => campaign.investment_term.max_investment,
        :securities_offered => 'EQUITY',
        #:over_funding_amount => 0,
        :issuer_signatory_email => user.email,
        :issuer_signatory_name => user.full_name,
        :issuer_signatory_title => 'Issuer'
    )
  end
end
