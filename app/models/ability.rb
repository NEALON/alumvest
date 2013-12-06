class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
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
    cannot :view_risk_n_challenge, Campaign
    cannot :view_financial, Campaign
    cannot :view_exact_funding_amount, Campaign
    cannot :view_pitch_deck, Campaign
    cannot :view_investment_doc, Campaign
    cannot :invest, Campaign

    unless user.nil?
      can :manage, User

      # owner
      if user.is_owner?
        can :manage, Owner

        can :view_risk_n_challenge, Campaign, :owner_id => user.owner.id
        can :view_financial, Campaign, :owner_id => user.owner.id
        can :view_exact_funding_amount, Campaign, :owner_id => user.owner.id
        can :view_pitch_deck, Campaign, :owner_id => user.owner.id
        can :view_investment_doc, Campaign, :owner_id => user.owner.id
      end

      if user.is_investor?
        can :manage, Investor

        if user.is_self_accredited_investor?
          can :view_risk_n_challenge, Campaign
          can :view_exact_funding_amount, Campaign
        end

        # this is a superset of self_accredited_investor
        if user.is_accredited_investor?
          can :view_financial, Campaign
          can :view_pitch_deck, Campaign
          can :view_investment_doc, Campaign
          can :invest, Campaign
        end

        # admin can do anything
        if user.is_admin?
          can :manage, Campaign
        end
      end
    end
  end
end
