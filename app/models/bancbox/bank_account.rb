class Bancbox::BankAccount < ActiveRecord::Base

  # polymorphic
  belongs_to :investor, class_name: 'Bancbox::Investor', :foreign_key => :bancbox_investor_id
  belongs_to :issuer, class_name: 'Bancbox::Issuer', :foreign_key => :bancbox_issuer_id

  attr_accessible :bancbox_id, :reference_id # BancBox's identifiers for this bank account

  # I can either fund a bancbox account from my banking account
  # TODO: taking money out via a withdrawal fund call
  # transfer between accounts as well
  # fund_escrow can be used to move funds into an escrow account?
  # we need to have a bb account class
  # we need to have a bb escrow account class, probably inherits from account? TBD
  # transaction class
  # bb account
  #  get account balance
  #  get transaction history
  #   via get_details
  #     maybe a rake task, or other event that polls for new values

  attr_accessible :bank_account_number, :bank_account_type
  attr_accessible :bank_account_holder, :bank_account_routing
  attr_accessible :bancbox_investor, :bancbox_issuer, :bancbox_investor_id, :bancbox_issuer_id

  validates_presence_of [:bank_account_number, :bank_account_type, :bank_account_holder, :bank_account_routing]
  # TODO should check routing number against https://www.fededirectory.frb.org/search_ACH.cfm maybe?
end
