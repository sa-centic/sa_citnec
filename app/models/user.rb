class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :email
  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, on: :create
  validate :password_complexity, on: :update

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  attr_accessor :role
  attr_accessor :course_id
  attr_accessor :course





  # belongs_to :courseholder, class_name: "User", optional: true


  # def active_for_authentication?
  # super & !(self.has_role?([:coursetaker]))
  # end

  scope :is_courseholder, -> { with_role :courseholder }


  def admin?
    type == 'admin'
  end

  def moderator?
    type == 'moderator'
  end

  #Add this to your migration
  # t.references :courseholder, foreign_key: { to_table: :user }
  #

  def full_name
    first_name + " " + last_name
  end

  def send_reset_password_instructions
    return false if self.has_role?  :coursetaker
    super
  end

  private


  def password_complexity
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end

end
