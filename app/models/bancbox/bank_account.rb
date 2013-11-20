class Bancbox::BankAccount < ActiveRecord::Base
  belongs_to :investor, class_name: 'Bancbox::Investor', :foreign_key => :bancbox_investor_id
  belongs_to :issuer, class_name: 'Bancbox::Issuer', :foreign_key => :bancbox_issuer_id

  attr_accessible :bancbox_id, :reference_id
  attr_accessible :bank_account_number, :bank_account_type
  attr_accessible :bank_account_holder, :bank_account_routing
  attr_accessible :bancbox_investor, :bancbox_issuer, :bancbox_investor_id, :bancbox_issuer_id

  validates_presence_of [:bank_account_number, :bank_account_type, :bank_account_holder, :bank_account_routing]
  # TODO should check routing number against https://www.fededirectory.frb.org/search_ACH.cfm maybe?
end
