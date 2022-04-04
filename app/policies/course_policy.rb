class CoursePolicy < ApplicationPolicy

  def new?
    user.has_role? :admin
  end

end