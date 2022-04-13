class Course < ApplicationRecord

  belongs_to :courseholder, class_name: 'Users::Courseholder', foreign_key: 'courseholder_id' ,optional: true

  has_one :print, class_name: 'Courses::Print'
  has_many :course_registrations
  has_many :coursetakers, through: :course_registrations, class_name: 'Users::Coursetaker'

  #Action_text relation


  validates_presence_of :course_name

  scope :with_courseholder, -> { where.not(courseholder_id: nil) }




  def exceeded_coursetakers
    errors.add(:user, 'Du skal fjerne nogle kursister før du kan lave denne handling') if max_coursetakers.count < coursetakers.count
  end

  def self.policy_class
    CoursePolicy
  end

end
