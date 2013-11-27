class Bancbox::Transaction < ActiveRecord::Base
  attr_accessible :bancbox_account, :bancbox_account_id, :value

  belongs_to :bancbox_account, :class_name => 'Bancbox::Account'

  def self.recent_first
    all.order('id desc')
  end
end
