class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= Alumvest::User::Base.new # guest user (not logged in)
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

    # default user
    cannot :view_risk_n_challenge, Alumvest::Campaign::Base
    cannot :view_financial, Alumvest::Campaign::Base
    cannot :view_exact_funding_amount, Alumvest::Campaign::Base
    cannot :view_pitch_deck, Alumvest::Campaign::Base
    cannot :view_investment_doc, Alumvest::Campaign::Base
    cannot :invest, Alumvest::Campaign::Base

    unless user.nil?
      can :manage, Alumvest::User::Base

      # issuer
      if user.is_issuer?
        can :manage, Alumvest::Issuer::Base

        can :view_risk_n_challenge, Alumvest::Campaign::Base, :issuer_id => user.issuer.id
        can :view_financial, Alumvest::Campaign::Base, :issuer_id => user.issuer.id
        can :view_exact_funding_amount, Alumvest::Campaign::Base, :issuer_id => user.issuer.id
        can :view_pitch_deck, Alumvest::Campaign::Base, :issuer_id => user.issuer.id
        can :view_investment_doc, Alumvest::Campaign::Base, :issuer_id => user.issuer.id
      end

      if user.is_investor?
        can :manage, Alumvest::Investor::Base
        can :manage, Alumvest::Investment::Base

        if user.is_self_accredited_investor?
          can :view_risk_n_challenge, Alumvest::Campaign::Base
          can :view_exact_funding_amount, Alumvest::Campaign::Base
          can :invest, Alumvest::Campaign::Base
        end

        # this is a superset of self_accredited_investor
        if user.is_accredited_investor?
          can :view_financial, Alumvest::Campaign::Base
          can :view_pitch_deck, Alumvest::Campaign::Base
          can :view_investment_doc, Alumvest::Campaign::Base
        end

        # admin can do anything
        if user.is_admin?
          can :manage, Alumvest::Campaign::Base
        end
      end
    end
  end
end
