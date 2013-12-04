module Features
  module FactoryHelpers

    def create_owner
      @identity = FactoryGirl.create(:identity,
                                     :last_name => 'Owner',
                                     :email => 'owner@alumvest.com')
      @user = FactoryGirl.create(:user,
                                 :first_name => 'Alumvest',
                                 :middle_name => 'Test',
                                 :last_name => 'Owner',
                                 :provider => 'identity',
                                 :email => 'owner@alumvest.com',
                                 :user_type => 'owner',
                                 :identities => [@identity],
                                 :uid => @identity.id)
    end

    def create_accredited_investor
      @identity = FactoryGirl.create(:identity,
                                     :last_name => 'Investor',
                                     :email => 'investor@alumvest.com')
      @user = FactoryGirl.create(:user,
                                 :first_name => 'Alumvest',
                                 :middle_name => 'Test',
                                 :last_name => 'Investor',
                                 :provider => 'identity',
                                 :email => 'investor@alumvest.com',
                                 :user_type => 'investor',
                                 :identities => [@identity],
                                 :uid => @identity.id,
                                 :profile_complete => true)
      @user.investor.update_attribute :accredited_investor_status, 'approved'
      @user
    end


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

