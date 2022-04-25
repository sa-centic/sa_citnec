module CoursesHelper

  def render_trix_with_vars(content)
    return content if content.nil?
    content.gsub!("%course_name%", + @course.course_name)
    content.gsub!("%course_description%", @course.course_description)
    content.gsub!("%max_coursetakers%", @course.max_coursetakers.to_s)
    content.gsub!("%coursetakers%", list_of_coursetakers(@course.coursetakers))
    puts content
    content
  end

  def standard_content
    "<h1><strong>%course_name%</strong></h1><div><strong><br>Beskrivelse:</strong> <em>%course_description%<br><br></em><strong>Max antal deltagere:</strong> %max_coursetakers%</div><div><br><strong>Liste af deltagere:<br></strong><br>%coursetakers%</div>"
  end


  def list_of_coursetakers(coursetakers)
    result = "<ul>"
    coursetakers.each do |ct|
      result += "<li>#{ct.full_name}</li>"
    end
    result += "</ul>"
  end





end
