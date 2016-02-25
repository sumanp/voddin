class Ability
  include CanCan::Ability

  def initialize(user)
    

    if user.admin?
      can :manage, :all

    else
      can :update, Project do |project|
        project.user == user
      end
      can :destroy, Project do |project|
        project.user == user
      end
      can :show, Project do |project|
        project.user == user
      end

      can :update, Note do |note|
        note.project.user == user
      end
      can :destroy, Note do |note|
        note.project.user == user
      end
      


      can :update, Comment do |comment|
        comment.user == user
      end
      can :destroy, Comment do |comment|
        comment.user == user
      end
      


      can :create, Project
      can :create, Note
      can :create, Comment
            
    end    
  end
end
