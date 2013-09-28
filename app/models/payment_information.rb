class PaymentInformation < ActiveRecord::Base
  include FinalizationStep
  attr_accessible :amount
end
