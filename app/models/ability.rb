class Ability
  include CanCan::Ability

  def initialize(user)

    # default user
    cannot :view_risk_n_challenge, CampaignBase
    cannot :view_financial, CampaignBase
    cannot :view_exact_funding_amount, CampaignBase
    cannot :view_pitch_deck, CampaignBase
    cannot :view_investment_doc, CampaignBase
    cannot :invest, CampaignBase

    unless user.nil?
      can :manage, UserBase
      can :manage, Bancbox::BankAccount, :user_id => user.id

      # issuer
      if user.is_issuer?
        can :manage,IssuerBase

        can :manage, CampaignBase, :issuer_id => user.issuer.id
        can :view_risk_n_challenge, CampaignBase, :issuer_id => user.issuer.id
        can :view_financial, CampaignBase, :issuer_id => user.issuer.id
        can :view_exact_funding_amount, CampaignBase, :issuer_id => user.issuer.id
        can :view_pitch_deck, CampaignBase, :issuer_id => user.issuer.id
        can :view_investment_doc, CampaignBase, :issuer_id => user.issuer.id
      end

      if user.is_investor?
        can :manage,InvestorBase
        can :manage, InvestmentBase
        can :manage, Alumvest::SelfAccreditedStatus, :investor_id => user.investor.id
        can :manage, Veritax::Order::Base, :investor_id => user.investor.id

        if user.is_self_accredited_investor?
          can :view_risk_n_challenge, CampaignBase
          can :view_exact_funding_amount, CampaignBase
          can :invest, CampaignBase
        end

        # this is a superset of self_accredited_investor
        if user.is_accredited_investor?
          can :view_financial, CampaignBase
          can :view_pitch_deck, CampaignBase
          can :view_investment_doc, CampaignBase
        end

        # admin can do anything
        if user.is_admin?
          can :manage, CampaignBase
        end
      end
    end
  end
end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= UserBase.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
