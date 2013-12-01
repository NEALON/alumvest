module Features
  module FactoryHelpers

    def create_live_campaign(owner)
      FactoryGirl.create(
          :campaign,
          :status => "live",
          :owner => owner,
          :company => FactoryGirl.create(
              :company,
              :category => FactoryGirl.create(
                  :category)),
          :investment_term => FactoryGirl.create(:investment_term),
          :team => FactoryGirl.create(:team)
      )
    end
  end
end

