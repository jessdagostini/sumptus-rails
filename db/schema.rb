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

ActiveRecord::Schema.define(version: 20170627132728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", id: :serial, force: :cascade do |t|
    t.string "area", limit: 250, null: false
  end

  create_table "outlays", id: :serial, force: :cascade do |t|
    t.integer "area_id", null: false
    t.integer "payform_id", null: false
    t.text "description"
    t.decimal "cost", null: false
    t.date "payment_day"
    t.boolean "paid", default: false
    t.index ["area_id"], name: "fki_area_id_fkey"
    t.index ["payform_id"], name: "fki_payform_id_fkey"
  end

  create_table "payforms", id: :serial, force: :cascade do |t|
    t.string "form", limit: 15, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "outlays", "areas", name: "area_id_fkey"
  add_foreign_key "outlays", "payforms", name: "payform_id_fkey"
end
