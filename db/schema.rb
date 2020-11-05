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

ActiveRecord::Schema.define(version: 2020_11_05_124528) do

  create_table "animals", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.integer "weight"
    t.string "species"
    t.string "breed"
    t.string "color"
    t.text "medical_info"
    t.boolean "altered"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "location"
    t.integer "user_id"
    t.integer "animal_id"
    t.datetime "appointment_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.string "city"
    t.string "state"
  end

  create_table "opening_hours", force: :cascade do |t|
    t.integer "company_id"
    t.integer "day"
    t.time "closes"
    t.time "opens"
    t.datetime "valid_from"
    t.datetime "valid_through"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.boolean "is_owner"
    t.boolean "is_vet"
    t.integer "owner_id"
    t.integer "animal_id"
    t.integer "vet_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
