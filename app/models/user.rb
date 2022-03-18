class User < ApplicationRecord
  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :coursetakers, class_name: "User",
           foreign_key: "courseholder_id"

  belongs_to :courseholder, class_name: "User", optional: true

  validates :courseholder_id, presence: true, if: Proc.new { |u| u.has_role?(:coursetaker)}



  #Add this to your migration
  # t.references :courseholder, foreign_key: { to_table: :user }



end
