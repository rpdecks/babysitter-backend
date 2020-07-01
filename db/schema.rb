# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_01_163842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "caregiver_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["caregiver_id"], name: "index_candidates_on_caregiver_id"
    t.index ["job_id"], name: "index_candidates_on_job_id"
  end

  create_table "caregiver_favorites", force: :cascade do |t|
    t.bigint "caregiver_id", null: false
    t.bigint "employer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["caregiver_id"], name: "index_caregiver_favorites_on_caregiver_id"
    t.index ["employer_id"], name: "index_caregiver_favorites_on_employer_id"
  end

  create_table "caregiver_reviews", force: :cascade do |t|
    t.bigint "caregiver_id", null: false
    t.bigint "employer_id", null: false
    t.integer "rating"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["caregiver_id"], name: "index_caregiver_reviews_on_caregiver_id"
    t.index ["employer_id"], name: "index_caregiver_reviews_on_employer_id"
  end

  create_table "caregivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address"
    t.date "dob"
    t.string "gender"
    t.string "phone"
    t.boolean "smoker"
    t.text "bio"
    t.boolean "has_pets"
    t.integer "job_count"
    t.float "pay_rate"
    t.boolean "first_aid_cert"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "employer_favorites", force: :cascade do |t|
    t.bigint "employer_id", null: false
    t.bigint "caregiver_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["caregiver_id"], name: "index_employer_favorites_on_caregiver_id"
    t.index ["employer_id"], name: "index_employer_favorites_on_employer_id"
  end

  create_table "employer_reviews", force: :cascade do |t|
    t.bigint "employer_id", null: false
    t.bigint "caregiver_id", null: false
    t.text "content"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["caregiver_id"], name: "index_employer_reviews_on_caregiver_id"
    t.index ["employer_id"], name: "index_employer_reviews_on_employer_id"
  end

  create_table "employers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "address"
    t.date "dob"
    t.string "gender"
    t.string "phone"
    t.boolean "smoker"
    t.text "bio"
    t.boolean "has_pets"
    t.integer "job_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  create_table "jobs", force: :cascade do |t|
    t.bigint "employer_id", null: false
    t.string "status", default: "incomplete"
    t.string "location"
    t.time "start_time"
    t.time "end_time"
    t.text "desc"
    t.integer "total_child_count"
    t.integer "infant_count"
    t.integer "toddler_count"
    t.integer "school_age_count"
    t.boolean "completed", default: false
    t.float "pay_rate"
    t.boolean "smoker"
    t.boolean "first_aid_cert"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "caregiver_id"
    t.text "title"
    t.date "start_date"
    t.date "end_date"
    t.index ["employer_id"], name: "index_jobs_on_employer_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.text "content"
    t.boolean "read"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_messages_on_job_id"
  end

  add_foreign_key "candidates", "caregivers"
  add_foreign_key "candidates", "jobs"
  add_foreign_key "caregiver_favorites", "caregivers"
  add_foreign_key "caregiver_favorites", "employers"
  add_foreign_key "caregiver_reviews", "caregivers"
  add_foreign_key "caregiver_reviews", "employers"
  add_foreign_key "employer_favorites", "caregivers"
  add_foreign_key "employer_favorites", "employers"
  add_foreign_key "employer_reviews", "caregivers"
  add_foreign_key "employer_reviews", "employers"
  add_foreign_key "jobs", "employers"
  add_foreign_key "messages", "jobs"
end
