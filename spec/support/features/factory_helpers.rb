module Features
  module FactoryHelpers

    def create_issuer
      @identity = FactoryGirl.create(:identity,
                                     :last_name => 'Issuer',
                                     :email => 'issuer@alumvest.com')
      @user = FactoryGirl.create(:user,
                                 :first_name => 'Alumvest',
                                 :middle_name => 'Test',
                                 :last_name => 'Issuer',
                                 :provider => 'identity',
                                 :email => 'issuer@alumvest.com',
                                 :user_type => 'Issuer',
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
                                 :user_type => 'Investor',
                                 :identities => [@identity],
                                 :uid => @identity.id)
      @user.investor.update_attribute :accredited_investor_status, 'approved'
      @user
    end

    def create_live_campaign(issuer)
      @campaign = FactoryGirl.create(
          :campaign,
          :status => 'live',
          :issuer => issuer,
          :company => FactoryGirl.create(
              :company,
              :category => FactoryGirl.create(
                  :category)),
          :investment_term => FactoryGirl.create(:investment_term),
          :team => FactoryGirl.create(:team),
          :bancbox_escrow =>  FactoryGirl.create(:vcr_established_bancbox_escrow)
      )
    end

    def create_live_campaign_without_escrow(issuer)
      @campaign = FactoryGirl.create(
          :campaign,
          :status => 'live',
          :issuer => issuer,
          :company => FactoryGirl.create(
              :company,
              :category => FactoryGirl.create(
                  :category)),
          :investment_term => FactoryGirl.create(:investment_term),
          :team => FactoryGirl.create(:team),
      )
    end

    def create_admin
        @identity = FactoryGirl.create(:identity,
                                       :last_name => 'Admin',
                                       :email => 'admin@alumvest.com')
        @user = FactoryGirl.create(:user,
                                   :first_name => 'Alumvest',
                                   :middle_name => 'Test',
                                   :last_name => 'Admin',
                                   :provider => 'identity',
                                   :email => 'admin@alumvest.com',
                                   :user_type => 'Admin',
                                   :identities => [@identity],
                                   :uid => @identity.id)
    end
  end
end

