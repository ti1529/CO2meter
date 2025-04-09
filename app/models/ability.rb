# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.present?
      cannot :manage, Company
      can :read, Co2EmissionFactor

      if user.admin?
        can :manage, :all
      end
    end
  end
end
