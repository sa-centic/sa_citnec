class CoursePolicy < ApplicationPolicy

  def new?
    user.type == 'Users::Admin'
  end

  def create?
    user.type == 'Users::Admin'
  end

  def update?
    user.type == 'Users::Admin'
  end

  def edit?
    user.type == 'Users::Admin'
  end

  def destroy?
    user.type == 'Users::Admin'
  end

end