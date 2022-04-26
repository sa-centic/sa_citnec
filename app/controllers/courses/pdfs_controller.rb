module Courses
  class PdfsController < ApplicationController
    before_action :set_course, only: [:new, :create]
    include CoursesHelper
    def index

    end

    def new

    end

    def create
      debugger
      pdf = Prawn::Document.new
      pdf.markup(render_trix_with_vars(course_params[:content]))
      pdf.render_file 'assignment.pdf'
      send_data pdf.render, filename: "#{@course.course_name}.pdf", type: "application/pdf"
    end

    private

    def course_params
      params.require(:course).permit(:content)
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

  end
end