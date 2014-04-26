class Bancbox::Investment < ActiveRecord::Base
  attr_accessible :bancbox_investor,
                  :bancbox_investor_id,
                  :project,
                  :investment_date,
                  :amount,
                  :is_refunded,
                  :is_cfp_fee_refunded,
                  :is_reversed,
                  :can_reverse

  belongs_to :bancbox_investor, :class_name => 'Bancbox::Investor'

end