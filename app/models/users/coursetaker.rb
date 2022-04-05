class Users::Coursetaker < User

  # def self.model_name
  #  Coursetaker.model_name
  # end


  has_many :course_registrations
  has_many :courses, through: :course_registrations
  accepts_nested_attributes_for :course_registrations, reject_if: :all_blank, allow_destroy: true

  validates_length_of :courses, maximum: 4

  validates_associated :course_registrations

end