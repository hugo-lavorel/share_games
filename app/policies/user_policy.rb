class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record == user
  end

  def update?
    show?
  end

  def edit?
    show?
  end

  def destroy?
    show?
  end
end
