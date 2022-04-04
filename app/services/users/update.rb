class Users::Update
  attr_reader :user
  attr_reader :coursetaker
  attr_reader :courseholder

  def self.call(user_params, user_id)
    new(user_params, user_id)
  end

  def initialize(user_params, user_id)
    @user = User.find(user_id)
    @role_name = user_params[:roles]
    @success = @user.update(user_params.except(:roles, :courseholder))
  end

  # def update
  #   @user.add_role Role.find(@role_name).name if @role_name.present?
  #   @success = @user.update(first_name: 'Ogsterville')
  #   self
  # end

  def success?
    @success
  end
end