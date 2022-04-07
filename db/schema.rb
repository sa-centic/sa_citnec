# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_04_07_093533) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_registrations", force: :cascade do |t|
    t.bigint "coursetaker_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_registrations_on_course_id"
    t.index ["coursetaker_id", "course_id"], name: "index_course_registrations_on_coursetaker_id_and_course_id", unique: true
    t.index ["coursetaker_id"], name: "index_course_registrations_on_coursetaker_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name", null: false
    t.text "course_description"
    t.integer "max_coursetakers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "courseholder_id"
    t.index ["courseholder_id"], name: "index_courses_on_courseholder_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "courses", "users", column: "courseholder_id"
end
