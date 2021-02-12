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

ActiveRecord::Schema.define(version: 2021_02_12_113214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicant_test_answers", force: :cascade do |t|
    t.string "value"
    t.bigint "applicant_test_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["applicant_test_id"], name: "index_applicant_test_answers_on_applicant_test_id"
    t.index ["question_id"], name: "index_applicant_test_answers_on_question_id"
  end

  create_table "applicant_test_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "applicant_tests", force: :cascade do |t|
    t.bigint "applicant_id", null: false
    t.datetime "due_date"
    t.bigint "applicant_test_status_id", default: 1, null: false
    t.bigint "quiz_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["applicant_id"], name: "index_applicant_tests_on_applicant_id"
    t.index ["applicant_test_status_id"], name: "index_applicant_tests_on_applicant_test_status_id"
    t.index ["quiz_id"], name: "index_applicant_tests_on_quiz_id"
  end

  create_table "applicants", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "token"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.string "correct_answer"
    t.string "field_type"
    t.string "input_type"
    t.jsonb "question_data"
    t.bigint "quiz_id", null: false
    t.bigint "quiz_page_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_questions_on_quiz_id"
    t.index ["quiz_page_id"], name: "index_questions_on_quiz_page_id"
  end

  create_table "quiz_pages", force: :cascade do |t|
    t.string "title"
    t.bigint "quiz_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quiz_id"], name: "index_quiz_pages_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.jsonb "quiz_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applicant_test_answers", "applicant_tests"
  add_foreign_key "applicant_test_answers", "questions"
  add_foreign_key "applicant_tests", "applicant_test_statuses"
  add_foreign_key "applicant_tests", "applicants"
  add_foreign_key "applicant_tests", "quizzes"
  add_foreign_key "questions", "quiz_pages"
  add_foreign_key "questions", "quizzes"
  add_foreign_key "quiz_pages", "quizzes"
end
