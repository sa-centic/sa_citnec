class AddIndexToCourseRegistrations < ActiveRecord::Migration[7.0]
  def change
    add_index :course_registrations, [:coursetaker_id, :course_id], unique: true
  end
end
