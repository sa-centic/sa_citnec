class Users::CourseholdersController < ApplicationController
  def new
    @courseholder = Users::Courseholder.new
  end

  def create
    byebug
    user_type = params[:class].constantize
    new_courseholder = Users::Create.call(courseholder_params, user_type)

    if new_courseholder.success?
      redirect_to users_path
    else
      @courseholder = new_courseholder.user
      render :new
    end
  end

  def edit
    @courseholder = Users::Courseholder.find(params[:id])
  end


  private

  def courseholder_params
    params.require(:users_courseholder).permit(:first_name, :last_name, :email, :course_id, :roles)
  end
end