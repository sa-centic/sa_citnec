class Courses::PrintsController < ApplicationController

  before_action :set_course, only: [:show, :edit, :update, :destroy, :new, :create]
  before_action :set_print, only:[:show, :edit, :update, :destroy, :new, :create]

  def edit
  end

  def show
  end

  def new
    @print = Courses::Print.new
  end

  def create
  end



  def print_params
    params.require(:courses_print).permit(:course_name, :courseholder_id, :course_description, :max_coursetakers, :content)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_print
    # @print = @course.print
     @print = Courses::Print.find(params[:id])
  end

end