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

ActiveRecord::Schema.define(version: 2022_03_11_115112) do

  create_table "black_list_tokens", charset: "latin1", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bookes", charset: "latin1", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "schedule_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id"], name: "index_bookes_on_schedule_id"
    t.index ["student_id"], name: "index_bookes_on_student_id"
  end

  create_table "lessons", charset: "latin1", force: :cascade do |t|
    t.string "subject"
    t.string "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", charset: "latin1", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.bigint "timeline_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_schedules_on_lesson_id"
    t.index ["timeline_id"], name: "index_schedules_on_timeline_id"
  end

  create_table "students", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teachers", charset: "latin1", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "timelines", charset: "latin1", force: :cascade do |t|
    t.datetime "from"
    t.datetime "to"
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_timelines_on_teacher_id"
  end

  add_foreign_key "bookes", "schedules"
  add_foreign_key "bookes", "students"
  add_foreign_key "schedules", "lessons"
  add_foreign_key "schedules", "timelines"
  add_foreign_key "timelines", "teachers"
end
