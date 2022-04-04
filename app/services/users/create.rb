class Users::Create

  def self.call(user_params, user_class=User)
    new(user_params, user_class).create
  end

  def initialize(user_params, user_class)
    @user = user_class.new(user_params.except(:roles))
    @role_name = user_params[:roles]
    @courses = user_params[:course_registrations_attributes]
    byebug
    @success = false
  end

  def create
    @user.add_role Role.find(@role_name).name if @role_name.present?
    # assign_courses(@courses) if @user.has_role? :attendant
    @user.password = SecureRandom.hex(16)
    if @user.save
      byebug
      @success = true
      send_invite_mail unless @user.has_role? :coursetaker
    end
    self
  end

  def success?
    @success
  end

  def user
    @user
  end

  private

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

  def assign_courses(courses)
    course_ids = courses.values.map { |c| c.values.first.to_i}
    byebug
    @user.courses << Course.find(course_ids)
  end
end