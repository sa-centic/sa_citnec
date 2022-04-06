module UsersHelper
  def list_users_courses(user)
    case user.type
    when 'Users::Coursetaker'
      sentence = user.courses.map{ |c| link_to(c.course_name, course_path(c)).html_safe }
      safe_join(sentence, ', ')
    when 'Users::Courseholder'
      link_to(user.course.course_name, course_path(user.course)) if user.course.present?
    else
      ''
    end
  end
end