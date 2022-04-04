class UsersController < ApplicationController
  def index
    @q = policy_scope(User).ransack(params[:q])
    @users = @q.result(distinct: true)
    #This will exclude the currently logged in user, from the index page, to avoid, accidentally deleting himself.
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    new_user = Users::Create.call(user_params)

    if new_user.success?
      redirect_to users_path
    else
      @user = new_user.user
      render :new
    end
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
    update_user = Users::Update.call(user_params, params[:id])
    if update_user.success?
      redirect_to update_user.user
    else
      render :edit
    end
  end


  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    redirect_to users_path, notice: t("common.deleted")
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :roles, courses_attributes: [:id, :course_name, :_destroy])
  end

  end
