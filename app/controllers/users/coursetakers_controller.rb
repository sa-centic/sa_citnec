class Users::CoursetakersController < ApplicationController

  before_action :set_coursetaker, only: [:show, :edit, :update, :destroy]


  def new
    @coursetaker = Users::Coursetaker.new
    @coursetaker.course_registrations.build
  end


  def create
    @coursetaker = Users::Coursetaker.new(coursetaker_params)
    @coursetaker.password = SecureRandom.hex(16)
    if @coursetaker.save
      session[:user_id] = @coursetaker.id
      redirect_to users_path, notice: t("common.the_user") + " " + t("common.with_name") + " " + Users::Coursetaker.last.first_name  + " " +
        Users::Coursetaker.last.last_name + "," + " " + t("common.and") + " " + t("common.with_email") + " " + Users::Coursetaker.last.email + " " + t("common.created")
    else
      render 'new'
    end
  end


  def update
    @coursetaker = Users::Coursetaker.find(params[:id])
    if @coursetaker.update(coursetaker_params)
      redirect_to users_path, notice: t("common.updated")
    else
      render 'edit'
    end
  end

  def edit
    @coursetaker = Users::Coursetaker.find(params[:id])
  end

  private

  def coursetaker_params
    params.require(:users_coursetaker).permit(:first_name, :last_name, :email, :type, course_registrations_attributes: [:course_id, :id, :_destroy])
  end

  def set_coursetaker
    @coursetaker = Users::Coursetaker.find(params[:id])
  end


end