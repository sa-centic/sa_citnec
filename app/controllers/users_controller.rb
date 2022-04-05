class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @q = policy_scope(User).ransack(params[:q])
    @users = @q.result(distinct: true)
    #This will exclude the currently logged in user, from the index page, to avoid, accidentally deleting himself.
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = SecureRandom.hex(16)
    #  @user.becomes!(Users::Coursetaker) if @user.has_role? :coursetaker
    # debugger
    if @user.save
      session[:user_id] = @user.id
      send_invite_mail unless @user.has_role? :coursetaker
      redirect_to users_path, notice: t("common.the_user") + " " + t("common.with_name") + " " + User.last.first_name  + " " +
         User.last.last_name + "," + " " + t("common.and") + " " + t("common.with_email") + " " + User.last.email + " " + t("common.created")
    else
      render 'new'
    end
  end



  def send_invite_mail
    token = generate_invitation_token
    UserMailer.invite_mail(@user, token).deliver_later
  end

  def generate_invitation_token
    token, enc = Devise.token_generator.generate(@user.class, :reset_password_token)
    @user.reset_password_token = enc
    @user.reset_password_sent_at = Time.current
    @user.save(validate: false)
    token
  end


  def edit
    authorize current_user
    @user = User.find(params[:id])
  end


  def update
    authorize current_user
    if @user.update(user_params)
      redirect_to users_path, notice: t("common.updated")
    else
      render 'edit'
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: t("common.deleted")
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :roles, courses_attributes: [:id, :course_name, :_destroy])
  end


  def set_user
    @user = User.find(params[:id])
  end

  end
