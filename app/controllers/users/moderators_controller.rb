class Users::ModeratorsController < ApplicationController

  before_action :set_moderator, only: [:show, :edit, :update, :destroy]


  def show
    @moderator = Users::Moderator.find(params[:id])
    authorize @moderator
  end

  def new
    @moderator = Users::Moderator.new
  end

  def create
    @moderator = Users::Moderator.new(moderator_params)
    @moderator.password = SecureRandom.hex(16)
    #  @user.becomes!(Users::Coursetaker) if @user.has_role? :coursetaker
    # debugger
    if @moderator.save
      session[:user_id] = @moderator.id
      send_invite_mail
      redirect_to users_path, notice: t("common.the_user") + " " + t("common.with_name") + " " + @moderator.first_name  + " " +
        @moderator.last_name + "," + " " + t("common.and") + " " + t("common.with_email") + " " + @moderator.email + " " + t("common.created")
    else
      render 'new'
    end
  end



  def send_invite_mail
    token = generate_invitation_token
    UserMailer.invite_mail(@moderator, token).deliver_later
  end

  def generate_invitation_token
    token, enc = Devise.token_generator.generate(@moderator.class, :reset_password_token)
    @moderator.reset_password_token = enc
    @moderator.reset_password_sent_at = Time.current
    @moderator.save(validate: false)
    token
  end


  def edit
    authorize current_user
    @moderator = Users::Moderator.find(params[:id])
  end


  def update
    authorize current_user
    if @moderator.update(moderator_params)
      redirect_to users_path, notice: t("common.updated")
    else
      render 'edit'
    end
  end


  def destroy
    @moderator = Users::Moderator.find(params[:id])
    authorize @moderator
    @moderator.destroy
    redirect_to users_path, notice: t("common.deleted")
  end

  private

  def moderator_params
    params.require(:users_moderator).permit(:first_name, :last_name, :email, :type, courses_attributes: [:id, :course_name, :_destroy])
  end

  def set_moderator
    @moderator = Users::Moderator.find(params[:id])
  end

end