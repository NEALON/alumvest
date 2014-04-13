class Alumvest::OnlinePaymentBase < ActiveRecord::Base
  include Alumvest::OnlinePaymentData
  include Alumvest::OnlinePaymentState
  include Alumvest::OnlinePaymentEvents
  include Alumvest::OnlinePaymentPresenters
end
