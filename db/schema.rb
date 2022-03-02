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

ActiveRecord::Schema.define(version: 2022_03_02_103024) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "service_tasks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "offset_day"
    t.bigint "service_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_service_tasks_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.bigint "user_service_id", null: false
    t.boolean "done"
    t.index ["user_id"], name: "index_tasks_on_user_id"
    t.index ["user_service_id"], name: "index_tasks_on_user_service_id"
  end

  create_table "user_services", force: :cascade do |t|
    t.string "contact_email"
    t.string "contact_phone"
    t.string "contact_name"
    t.string "contact_address"
    t.bigint "service_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["service_id"], name: "index_user_services_on_service_id"
    t.index ["user_id"], name: "index_user_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "last_name"
    t.string "first_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "service_tasks", "services"
  add_foreign_key "tasks", "user_services"
  add_foreign_key "tasks", "users"
  add_foreign_key "user_services", "services"
  add_foreign_key "user_services", "users"
end
