class User < ApplicationRecord
  rolify
  validate :must_have_a_role
  validates :courseholder_id, presence: true, if: Proc.new { |u| u.has_role?(:coursetaker)}
  validates_presence_of :first_name, :last_name
  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, on: :create
  validate :password_complexity, on: :update

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :coursetakers, class_name: "User",
           foreign_key: "courseholder_id"

  belongs_to :courseholder, class_name: "User", optional: true




  scope :is_courseholder, -> { with_role :courseholder }

  scope :with_any_role, ->(names) do
    where(id: joins(:roles).select('users.id').distinct.where("roles.name IN (?)", names))
  end

  scope :without_role, ->(names) do
    where(id: joins(:roles).select('users.id').distinct.where.not("roles.name IN (?)", names))
  end

  #Add this to your migration
  # t.references :courseholder, foreign_key: { to_table: :user }

  private

  def must_have_a_role
    errors.add(:role_ids, "skal vælges") unless roles.any?
  end

  def password_complexity
    if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$/)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end

end
