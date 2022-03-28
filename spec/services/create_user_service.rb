class CreateUserService
  class CreateUserService
    def perform(user_params)
      new_user = User.new user_params.merge(password: Devise.friendly_token(10))
      new_user.add_role :reader
      @success = new_user.save
      if @success
        token = new_user.send('set_reset_password_token')
        UserMailer.with(user: new_user, token: token).invite_mail.deliver
      end
    end

    def success?
      @success
    end
  end
end