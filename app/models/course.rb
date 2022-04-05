class Course < ApplicationRecord

  validates_presence_of :course_name

  belongs_to :courseholder, class_name: 'Users::Courseholder', foreign_key: 'courseholder_id' ,optional: true
  has_many :course_registrations
  has_many :coursetakers, through: :course_registrations, class_name: 'Users::Coursetaker'

  scope :with_courseholder, -> { where.not(courseholder_id: nil) }




end
