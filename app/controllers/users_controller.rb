class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = policy_scope(User)

    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = SecureRandom.hex(16)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "The user #{@user.email}, has been succesfully created"
      send_invite_mail unless @user.has_role? :courseholder
      redirect_to users_path
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
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role_ids)
  end

  def set_user
    @user = User.find(params[:id])
  end

  end
