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

ActiveRecord::Schema.define(version: 2023_02_28_155757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conditions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "related_question_answers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "related_question_id", null: false
    t.boolean "answer", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["related_question_id"], name: "index_related_question_answers_on_related_question_id"
    t.index ["user_id"], name: "index_related_question_answers_on_user_id"
  end

  create_table "related_questions", force: :cascade do |t|
    t.string "content"
    t.string "related_on_type"
    t.integer "related_on_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_conditions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "condition_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["condition_id"], name: "index_user_conditions_on_condition_id"
    t.index ["user_id"], name: "index_user_conditions_on_user_id"
  end

  create_table "user_symptoms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "symptom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["symptom_id"], name: "index_user_symptoms_on_symptom_id"
    t.index ["user_id"], name: "index_user_symptoms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "fitness_activity"
    t.boolean "has_insurance", default: false
    t.string "insurance_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "answered_questions", default: false
    t.boolean "completed_onboarding", default: false
    t.datetime "answered_questions_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "related_question_answers", "related_questions"
  add_foreign_key "related_question_answers", "users"
  add_foreign_key "user_conditions", "conditions"
  add_foreign_key "user_conditions", "users"
  add_foreign_key "user_symptoms", "symptoms"
  add_foreign_key "user_symptoms", "users"
end
