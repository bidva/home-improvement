class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
  
  def destroy?
    user.admin? || record.user == user || record.public
  end

  def update?
    user.admin? || record.user == user || record.public
  end

  def edit?
    user.admin? || record.user == user || record.public
  end
end