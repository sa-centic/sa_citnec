class CreateCourseRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :course_registrations do |t|
      t.belongs_to :coursetaker
      t.belongs_to :course
      t.timestamps
    end
  end
end
