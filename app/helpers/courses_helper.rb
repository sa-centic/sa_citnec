module CoursesHelper

  def render_trix_with_vars(content)
    content.print("%{course_name}%", @course.course_name)


  end


end
