module Courses

class PrintsController < ApplicationController
  before_action :set_course

  def index

  end

  def edit
  end

  def show
  end

  def new
    @print = Print.new
  end

  def create
    #TODO:
    # When i click the create button, it should do the following:
    # Initialize print process, and assign it to prawn, with the params[:courses_print]
    # respond with finished pdf

  end



  def print_params
    params.require(:courses_print).permit(:course_name, :courseholder_id, :course_description, :max_coursetakers, :content)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end


end
end