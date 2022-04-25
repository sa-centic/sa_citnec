class CoursesController < ApplicationController

  require 'prawn'

  before_action :set_course, only: [:show, :edit, :update, :destroy]
  include CoursesHelper

  def index
    @q = Course.ransack(params[:q])
    @courses = @q.result(distinct: true)
  end

  def show
  end

  def print
    @course = Course.find(params[:id])
    pdf = Prawn::Document.new
    pdf.markup(render_trix_with_vars(@course.content.body.to_rendered_html_with_layout))
    pdf.render_file 'assignment.pdf'
    send_data pdf.render, filename: "#{@course.course_name}.pdf", type: "application/pdf"
  end

  def new
    authorize current_user, policy_class: CoursePolicy
    @course = Course.new
  end

  def create
    authorize current_user, policy_class: CoursePolicy
    @course = Course.new(course_params.except(:courseholder))
    @course.courseholder = User.find(course_params[:courseholder].to_i) unless course_params[:courseholder].blank?
    @course.content.body = standard_content

    if @course.save
      redirect_to courses_path, notice: "Nyt Kursus er blevet oprettet"
    else
      render 'new'
    end

  end

  def edit
    authorize current_user, policy_class: CoursePolicy
  end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: ("Kursus er blevet opdateret")
    else
      render 'edit'
    end
  end

  def destroy
    authorize current_user, policy_class: CoursePolicy
      @course.destroy
      redirect_to courses_path, status: :see_other, notice: ("Kursus er blevet slettet")
  end

  private

  def course_params
    params.require(:course).permit(:course_name, :courseholder_id, :course_description, :max_coursetakers, :content)
  end

  def set_course
    @course = Course.find(params[:id])
  end
  end