class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    else

      # Non-admin users can only manage their own resources
      can :manage, :all

      # Users can only update their own profile
      can :update, User, id: user.id

      # Prevent non-admin users from updating their role
      cannot :update, User, role: 'admin'
    end
  end
end
