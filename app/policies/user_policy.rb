class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.has_role? :admin
        scope.all
      elsif user.has_role? :moderator
        scope.without_role([:admin])
      else
        scope.with_any_role([:courseholder, :coursetaker])
      end
    end
  end

  # def index?
  #   false unless user.has_role? :admin
  # end

  def show?
    user.has_role? :admin or (user.roles.ids.first <= record.roles.ids.first)
  end

  def update?
    edit?
  end

  def edit?
    user.has_role? :admin or (user.has_role? :moderator and !record.has_role? :admin)
  end

  def destroy?
    user.has_role? :admin or (user.has_role? :moderator and !record.has_role? :admin)
  end
end