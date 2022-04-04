class Users::CoursetakersController < ApplicationController
  def new
    @coursetaker = Users::Coursetaker.new
    @coursetaker.course_registrations.build
  end


  def create

    user_type = params[:class].constantize
    new_coursetaker = Users::Create.call(coursetaker_params, user_type)

    if new_coursetaker.success?
      redirect_to users_path
    else
      @coursetaker = new_coursetaker.user
      render :new
    end
  end


  def edit
    @coursetaker = Users::Coursetaker.find(params[:id])
  end

  private

  def coursetaker_params
    params.require(:users_coursetaker).permit(:first_name, :last_name, :email, :roles, course_registrations_attributes: [:course_id, :_destroy])
  end
end