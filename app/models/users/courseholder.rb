class Users::Courseholder < User

  # def self.model_name
  #  Courseholder.model_name
  # end

  attr_accessor :course_id
  has_one :course, foreign_key: 'courseholder_id'
end