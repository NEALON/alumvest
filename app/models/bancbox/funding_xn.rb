class Bancbox::FundingXn < ActiveRecord::Base

  attr_accessible :online_payment, :online_payment_id, :escrow, :escrow_id

  belongs_to :online_payment,
             :class_name => 'Alumvest::OnlinePaymentBase',
             :foreign_key => 'payment_id'

  belongs_to :bancbox_escrow,
             :class_name => 'Bancbox::EscrowBase'

  # other possible fields
  #  :amount
  #  :trans_id,
  #  :status,
  #  :trans_status,
  #  :memo,
  #  :text,
end
