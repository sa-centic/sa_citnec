class Users::AdminsController < ApplicationController

  before_action :set_admin, only: [:show, :edit, :update, :destroy]


  def show
    @admin = Users::Admin.find(params[:id])
    authorize @admin
  end

  def new
    @admin = Users::Admin.new
  end

  def create
    @admin = Users::Admin.new(admin_params)
    @admin.password = SecureRandom.hex(16)
    #  @user.becomes!(Users::Coursetaker) if @user.has_role? :coursetaker
    # debugger
    if @admin.save
      session[:user_id] = @admin.id
      User.send_invite_mail
      redirect_to users_path, notice: t("common.the_user") + " " + t("common.with_name") + " " + @admin.first_name  + " " +
        @admin.last_name + "," + " " + t("common.and") + " " + t("common.with_email") + " " + @admin.email + " " + t("common.created")
    else
      render 'new'
    end
  end



  # def send_invite_mail
  #   token = generate_invitation_token
  #   UserMailer.invite_mail(@admin, token).deliver_later
  # end
  #
  # def generate_invitation_token
  #   token, enc = Devise.token_generator.generate(@admin.class, :reset_password_token)
  #   @admin.reset_password_token = enc
  #   @admin.reset_password_sent_at = Time.current
  #   @admin.save(validate: false)
  #   token
  # end


  def edit
     authorize current_user
    @admin = Users::Admin.find(params[:id])
  end


  def update
     authorize current_user
    if @admin.update(admin_params)
      redirect_to users_path, notice: t("common.updated")
    else
      render 'edit'
    end
  end


  def destroy
    @admin = Users::Admin.find(params[:id])
    authorize @admin
    @admin.destroy
    redirect_to users_path, notice: t("common.deleted")
  end

  private

  def admin_params
    params.require(:users_admin).permit(:first_name, :last_name, :email, :type, courses_attributes: [:id, :course_name, :_destroy])
  end

  def set_admin
    @admin = Users::Admin.find(params[:id])
  end

end