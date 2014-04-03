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

    bancbox_investor.populate_fields_from_user(user)

    begin
      bancbox_investor.submit!(bank_account)
    rescue BancBoxCrowd::Error => e
      e
    end
  end

  def self.submit_issuer!(user, bank_account)

    bancbox_issuer = user.issuer.bancbox_issuer ||
        Bancbox::Issuer.create(
            :issuer => user.issuer,
            :agreement => true)

    # TODO yuck, let's remove this redundancy:
    bancbox_issuer.populate_fields_from_user(user)

    begin
      bancbox_issuer.submit!(bank_account)
    rescue BancBoxCrowd::Error => e
      e
    end
  end
end
