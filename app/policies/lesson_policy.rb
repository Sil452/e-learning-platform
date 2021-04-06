class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def edit? 
    @record.course.user == @user
  end
  
  def update?
    @record.course.user == @user
  end

  def new?
    #@user.has_role?(:teacher)
  end
  
  def create?
   # @user.has_role?(:teacher)
  end
  
  def destroy?
    @record.course.user == @user
  end
  
end