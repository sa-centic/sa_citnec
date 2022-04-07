class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve

      if @user.type == 'Users::Admin'
        scope.all
      elsif user.type == 'Users::Moderator'
        scope.where.not(type: ['Users::Admin'])
      else
        scope.where(['Users::Courseholder', 'Users::Coursetaker'])
      end
    end
  end

  # def index?
  #   false unless user.has_role? :admin
  # end

  def show?
    user.type == 'Users::Admin' or (user.type.first <= record.type.first)
  end

  def update?
    edit?
  end

  def edit?
    user.type == 'Users::Admin' or (user.type == 'Users::Moderator' and !record.type == 'Users::Admin')
  end

  def destroy?
    user.type == 'Users::Admin' or (user.type == 'Users::Moderator' and !record.type == 'Users::Admin')
  end
end