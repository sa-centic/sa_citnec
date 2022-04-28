module Courses
  class MultiplePdfsController < ApplicationController
    include CoursesHelper
    def index

    end

    def new

    end

    def create
      @courses = Course.find(params[:course_ids])
      debugger
      pdf = Prawn::Document.new
      @courses.each do |course|
        @course = course
        pdf.markup(render_trix_with_vars(course.content.body.to_rendered_html_with_layout)) if course.content.body

      end
      pdf.render_file 'assignment.pdf'
      send_data pdf.render, filename: "pdf", type: "application/pdf"
    end



    private

    def course_params
      params.permit(:course_ids, :commit, :authenticity_token, :course_id, :course_name, :content)
    end

    def set_course
      @course = Course.find(params[:course_id, :course_ids])
    end

  end
end