  class Ability
    include CanCan::Ability
    
    def initialize(user)
      user ||= User.new # guest user
      
      if user.role? :admin
        can :manage, :all
        can :read, User
        can :update, User
      else
        can :read, :all
        can :create, Comment
        can :update, Comment do |comment|
          comment.try(:user) == user
        end
        if user.role?(:artist)
          can :create, Track
          can :update, Track do |track|
            track.try(:user) == user
          end
        end
      end
    end
  end
