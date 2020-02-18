# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_13_195236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "user_sku"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.bigint "instructor_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "trip_id"
    t.index ["instructor_id"], name: "index_orders_on_instructor_id"
    t.index ["student_id"], name: "index_orders_on_student_id"
    t.index ["trip_id"], name: "index_orders_on_trip_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "url"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "instructor_id"
    t.bigint "student_id"
    t.text "description"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_reviews_on_instructor_id"
    t.index ["student_id"], name: "index_reviews_on_student_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["trip_id"], name: "index_sessions_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "instructor_id"
    t.bigint "student_id"
    t.integer "num_students"
    t.integer "status", default: 0
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["instructor_id"], name: "index_trips_on_instructor_id"
    t.index ["student_id"], name: "index_trips_on_student_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "phone"
    t.text "description"
    t.integer "min_booking_hours"
    t.integer "level"
    t.integer "day_rate"
    t.string "resort"
    t.string "avatar"
    t.integer "max_num_students"
    t.date "birth_date"
    t.integer "role"
    t.integer "hourly_rate_cents", default: 0, null: false
    t.float "ratings_average"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "users", column: "instructor_id"
  add_foreign_key "orders", "users", column: "student_id"
  add_foreign_key "photos", "users"
  add_foreign_key "reviews", "users", column: "instructor_id"
  add_foreign_key "reviews", "users", column: "student_id"
  add_foreign_key "sessions", "trips"
  add_foreign_key "trips", "users", column: "instructor_id"
  add_foreign_key "trips", "users", column: "student_id"
end
