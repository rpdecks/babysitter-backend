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

ActiveRecord::Schema.define(version: 2020_06_25_010112) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_opportunities", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.integer "employer_id"
    t.integer "caregiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["job_id"], name: "index_job_opportunities_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "status", default: "incomplete"
    t.string "location"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text "desc"
    t.integer "total_children"
    t.integer "infants"
    t.integer "toddlers"
    t.integer "school_age"
    t.boolean "smoking"
    t.boolean "completed", default: false
    t.boolean "first_aid_cert", default: false
    t.integer "caregiver_id"
    t.integer "employer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.boolean "read"
    t.bigint "conversation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "participants", force: :cascade do |t|
    t.integer "user_id"
    t.integer "conversation_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "content"
    t.integer "reviewer_id"
    t.integer "reviewed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "username"
    t.string "email"
    t.string "phone"
    t.date "dob"
    t.boolean "smoker"
    t.boolean "first_aid_cert"
    t.text "bio"
    t.float "pay_rate"
    t.string "address"
    t.boolean "has_pets"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "job_opportunities", "jobs"
  add_foreign_key "messages", "conversations"
end
