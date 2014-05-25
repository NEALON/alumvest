class Ability
  include CanCan::Ability

  def initialize(user)

    # default user
    cannot :view_risk_n_challenge, Alumvest::CampaignBase
    cannot :view_financial, Alumvest::CampaignBase
    cannot :view_exact_funding_amount, Alumvest::CampaignBase
    cannot :view_pitch_deck, Alumvest::CampaignBase
    cannot :view_investment_doc, Alumvest::CampaignBase
    cannot :invest, Alumvest::CampaignBase

    unless user.nil?
      can :manage, Alumvest::UserBase
      can :manage, Bancbox::BankAccount, :user_id => user.id

      # issuer
      if user.is_issuer?
        can :manage, Alumvest::IssuerBase

        can :manage, Alumvest::CampaignBase, :issuer_id => user.issuer.id
        can :view_risk_n_challenge, Alumvest::CampaignBase, :issuer_id => user.issuer.id
        can :view_financial, Alumvest::CampaignBase, :issuer_id => user.issuer.id
        can :view_exact_funding_amount, Alumvest::CampaignBase, :issuer_id => user.issuer.id
        can :view_pitch_deck, Alumvest::CampaignBase, :issuer_id => user.issuer.id
        can :view_investment_doc, Alumvest::CampaignBase, :issuer_id => user.issuer.id
      end

      if user.is_investor?
        can :manage, Alumvest::InvestorBase
        can :manage, Alumvest::InvestmentBase

        can :manage, Alumvest::SelfAccreditedStatus, :investor_id => user.investor.id
        can :manage, Veritax::OrderBase, :investor_id => user.investor.id

        if user.is_self_accredited_investor? or user.is_accredited_investor?
          can :view_risk_n_challenge, Alumvest::CampaignBase
          can :view_exact_funding_amount, Alumvest::CampaignBase
          can :invest, Alumvest::CampaignBase

          if user.is_accredited_investor?
            can :view_financial, Alumvest::CampaignBase
            can :view_pitch_deck, Alumvest::CampaignBase
            can :view_investment_doc, Alumvest::CampaignBase
          end
        end

        # admin can do anything
        if user.is_admin?
          can :manage, Alumvest::CampaignBase
        end
      end
    end
  end
end

# Define abilities for the passed in user here. For example:
#
#   user ||= Alumvest::UserBase.new # guest user (not logged in)
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
