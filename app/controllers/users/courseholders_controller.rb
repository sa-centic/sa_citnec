class Users::CourseholdersController < ApplicationController

  before_action :set_courseholder, only: [ :show, :edit, :update, :destroy]


  def new
    @courseholder = Users::Courseholder.new
  end

  # def show
  #   @courseholder = Users::Courseholder.find(params[:id])
  # end

  def create
    @courseholder = Users::Courseholder.new(courseholder_params)
    @courseholder.password = SecureRandom.hex(16)
    if @courseholder.save
      session[:user_id] = @courseholder.id
      redirect_to users_path, notice: t("common.the_user") + " " + t("common.with_name") + " " + @courseholder.first_name  + " " +
      @courseholder.last_name + "," + " " + t("common.and") + " " + t("common.with_email") + " " + @courseholder.email + " " + t("common.created")
    else
      render 'new'
    end
  end

  def edit
    @courseholder = Users::Courseholder.find(params[:id])
  end

  def update
    @courseholder = Users::Courseholder.find(params[:id])
    if @courseholder.update(courseholder_params)
      redirect_to users_path, notice: t("common.updated")
    else
      render 'edit'
    end
  end

  private

  def courseholder_params
    params.require(:users_courseholder).permit(:first_name, :last_name, :email, :courses, :course_id, :role_ids, course_registrations_attributes: [:course_id, :id, :_destroy])
  end

  def set_courseholder
    @courseholder = Users::Courseholder.find(params[:id])
  end

end