class CourseRegistration < ApplicationRecord
  belongs_to :coursetaker, class_name: 'Users::Coursetaker'
  belongs_to :course

  validate :maximum_coursetakers
  validates_uniqueness_of :coursetaker_id, scope: :course_id

  scope :with_same_coursetaker, ->(course_registration) { where.not(id: course_registration.id).where(coursetaker: course_registration.coursetaker) }

  def maximum_coursetakers
    errors.add(:user, 'This is a test') if CourseRegistration.with_same_coursetaker(self).count > 3
  end
end