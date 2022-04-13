class CreatePrints < ActiveRecord::Migration[7.0]
  def change
    create_table :prints do |t|
      t.belongs_to :course, foreign_key: true
      t.timestamps
    end
  end
end
