class Bancbox::FundingXn < ActiveRecord::Base

  attr_accessible :investment, :investment_id, :bancbox_escrow, :escrow_id

  belongs_to :investment, :class_name => 'Alumvest::Investment::Base'

  belongs_to :bancbox_escrow, :class_name => 'Bancbox::Escrow::Base'

  # other possible fields
  #  :amount, although that would be a de-normalization
  #  :trans_id,
  #  :status,
  #  :trans_status,
  #  :amount,
  #  :memo,
  #  :text,

end
