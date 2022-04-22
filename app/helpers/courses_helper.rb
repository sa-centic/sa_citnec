module CoursesHelper

  def render_trix_with_vars(content)
    content.gsub!("%course_name%", + @course.course_name)
    content.gsub!("%course_description%", @course.course_description)
    content.gsub!("%max_coursetakers%", @course.max_coursetakers.to_s)
    content.gsub!("%coursetakers%", list_of_coursetakers(@course.coursetakers))
    puts content
    content
  end

  def list_of_coursetakers(coursetakers)
    result = "<ul>"
    coursetakers.each do |ct|
      result += "<li>#{ct.full_name}</li>"
    end
    result += "</ul>"
  end

end
