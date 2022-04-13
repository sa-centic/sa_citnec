class Course < ApplicationRecord

  validates_presence_of :course_name

  belongs_to :courseholder, class_name: 'Users::Courseholder', foreign_key: 'courseholder_id' ,optional: true
  has_many :course_registrations
  has_many :coursetakers, through: :course_registrations, class_name: 'Users::Coursetaker'


  # has_rich_text :course_name_rich
  # has_rich_text :course_description_rich
  # has_rich_text :max_coursetakers_rich
  # has_rich_text :courseholder_id_rich

  has_rich_text :content




  scope :with_courseholder, -> { where.not(courseholder_id: nil) }

  def convert_to_rich_text(klass, attribute)
    klass.find_each do |record|
      ActiveRecord::Base.no_touching do
        ActionText::RichText.new(name: attribute.to_s, body: ActionText::Content.new(record.read_attribute(attribute)), record_type: klass.to_s, record_id: record.id, created_at: record.created_at, updated_at: record.updated_at).save
      end
    end
  end


  def exceeded_coursetakers
    errors.add(:user, 'Du skal fjerne nogle kursister før du kan lave denne handling') if max_coursetakers.count < coursetakers.count
  end

  def self.policy_class
    CoursePolicy
  end

end
