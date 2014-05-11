module Features
  module FactoryHelpers

    def create_issuer
      @identity = FactoryGirl.create(:identity,
                                     :last_name => 'Issuer',
                                     :email => 'issuer@alumvest.com')
      @user = FactoryGirl.create(:user,
                                 :first_name => 'Issuer',
                                 :middle_name => 'Test',
                                 :last_name => 'Alumvest',
                                 :provider => 'identity',
                                 :email => 'issuer@alumvest.com',
                                 :user_type => 'Issuer',
                                 :identities => [@identity],
                                 :uid => @identity.id)
    end

    def create_issuer_and_live_campaign
      identity = FactoryGirl.create(:identity,
                                    :last_name => 'Issuer',
                                    :email => 'issuer+live@alumvest.com')
      user = FactoryGirl.create(:user,
                                :first_name => 'Issuer',
                                :middle_name => 'Test',
                                :last_name => 'Alumvest',
                                :provider => 'identity',
                                :email => 'issuer+live@alumvest.com',
                                :user_type => 'Issuer',
                                :identities => [identity],
                                :uid => identity.id)
      create_live_campaign(user.issuer)
    end

    def create_accredited_investor
      create_non_accredited_investor
      update_accredited_investor_status 'approved'
      @user
    end

    def create_self_accredited_investor
      create_non_accredited_investor
      update_accredited_investor_status 'self'
      @user
    end

    def update_accredited_investor_status(status)
      @user.investor.update_attribute :accredited_investor_status, status
    end

    def create_non_accredited_investor
      @identity = FactoryGirl.create(:identity,
                                     :last_name => 'Investor',
                                     :email => 'investor@alumvest.com')
      @user = FactoryGirl.create(:user,
                                 :first_name => 'Investor',
                                 :middle_name => 'Test',
                                 :last_name => 'Alumvest',
                                 :provider => 'identity',
                                 :email => 'investor@alumvest.com',
                                 :user_type => 'Investor',
                                 :identities => [@identity],
                                 :uid => @identity.id)
    end

    def create_investment(campaign, investor)
      @investment = FactoryGirl.create(:investment, :amount => 100, :campaign => campaign, :investor => investor)
    end

    def create_draft_campaign(issuer)
      @campaign = FactoryGirl.create(:campaign,
                                     :status => 'draft',
                                     :issuer => issuer,
                                     :company =>
                                         FactoryGirl.create(:company,
                                                            :category =>
                                                                FactoryGirl.create(:category)),
                                     :investment_term => FactoryGirl.create(:investment_term),
                                     :team => FactoryGirl.create(:team)
      )
      @document = FactoryGirl.create(:signable_subscription_document, :documentable => @campaign.investment_term)
      @campaign
    end

    def create_publishable_campaign(issuer)
      @campaign = FactoryGirl.create(:campaign,
                                     :status => 'draft',
                                     :issuer => issuer,
                                     :company =>
                                         FactoryGirl.create(:company,
                                                            :status => 'ready_for_review',
                                                            :category =>
                                                                FactoryGirl.create(:category)),
                                     :investment_term => FactoryGirl.create(:investment_term, :status => 'ready_for_review')
      )
      @campaign.team = create_team_via_factories(@campaign, :create)
      @campaign.team.make_ready_for_review
      @campaign.save
      @document = FactoryGirl.create(:signable_subscription_document, :documentable => @campaign.investment_term)
      @campaign
    end

    def create_team_via_factories(campaign, build_or_create = :build)
      team = FactoryGirl.send(build_or_create, :team, :campaign => campaign)
      team.team_members << FactoryGirl.create(:team_member)
      team
    end

    def create_published_campaign(issuer)
      campaign = create_publishable_campaign(issuer)
      campaign.publish
      campaign
    end

    def create_accepted_campaign(issuer)
      campaign = create_published_campaign(issuer)
      campaign.accept
      campaign
    end

    def create_accepted_campaign_with_escrow(issuer)
      campaign = create_accepted_campaign(issuer)
      campaign.update_attribute(:status, 'escrow_created')
      FactoryGirl.create(:bancbox_escrow,
                         :campaign => campaign,
                         :status => 'OPEN_PENDING',
                         :bancbox_status => 'open_pending')
      campaign.reload
    end


    def create_live_campaign(issuer)
      @campaign = FactoryGirl.create(:campaign,
                                     :status => 'live',
                                     :issuer => issuer,
                                     :company =>
                                         FactoryGirl.create(:company,
                                                            :category =>
                                                                FactoryGirl.create(:category)),
                                     :investment_term => FactoryGirl.create(:investment_term),
                                     :team => FactoryGirl.create(:team),
                                     :bancbox_escrow => FactoryGirl.create(:vcr_established_bancbox_escrow)
      )
      FactoryGirl.create(:signable_subscription_document, :documentable => @campaign.investment_term)
      @campaign.reload
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
          :team => FactoryGirl.create(:team)
      )
    end

    def create_admin
      @identity = FactoryGirl.create(:identity,
                                     :last_name => 'Admin',
                                     :email => 'admin@alumvest.com')
      @user = FactoryGirl.create(:user,
                                 :first_name => 'Admin',
                                 :middle_name => 'Test',
                                 :last_name => 'Alumvest',
                                 :provider => 'identity',
                                 :email => 'admin@alumvest.com',
                                 :user_type => 'Admin',
                                 :identities => [@identity],
                                 :uid => @identity.id)
    end
  end
end

