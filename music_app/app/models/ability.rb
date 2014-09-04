  class Ability
    include CanCan::Ability
    
    def initialize(user)
      user ||= User.new

      case 
      when user.role?(:listener)
        can :read, Track
        can :create, Comment
        can :update, Comment, user_id: user.id
        can :create, Flag
        can :update, User, id: user.id
        can :read, User, id: user.id

      when user.role?(:artist)
        can :create, Track
        can :update, Track, user_id: user.id
        can :read, Track
        can :create, Comment
        can :update, Comment, user_id: user.id
        can :create, Flag
        can :update, User, id: user.id
        can :read, User, id: user.id

      when user.role?(:admin)
        can :manage, :all
        cannot :create, Flag
      
      else
        can :read, Track
        can :create, User

      end

      end
   end   