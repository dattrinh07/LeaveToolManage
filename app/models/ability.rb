class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? (:Admin)
      can :manage, :all
    elsif user.has_role? (:Hr)
      can :manage, User
      # can :read, Project
    elsif user.has_role? (:Employee)
      # can :read, Project
    end 
  end
end