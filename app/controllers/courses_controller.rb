class CoursesController < ApplicationController

  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @q = Course.ransack(params[:q])
    @courses = @q.result(distinct: true)
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params.except(:courseholder))
    debugger
    @course.courseholder = User.find(course_params[:courseholder].to_i) unless course_params[:courseholder].blank?
    if @course.save
      redirect_to courses_path, notice: "!Placeholder KIG I DIN CONTROLLER! Gemt"
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to courses_path, notice: ("!Placeholder KIG I DIN CONTROLLER! Opdateret")
    else
      render 'edit'
    end
  end

  def destroy
      @course.destroy
      redirect_to courses_path, status: :see_other, notice: ("!Placeholder KIG I DIN CONTROLLER! Slettet")
  end

  private

  def course_params
    params.require(:course).permit(:course_name, :courseholder_id, :course_description, :max_coursetakers)
  end

  def set_course
    @course = Course.find(params[:id])
  end


end
