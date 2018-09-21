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

ActiveRecord::Schema.define(version: 2018_09_21_025940) do

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expense_entries", force: :cascade do |t|
    t.date "created"
    t.text "description"
    t.decimal "travel_distance"
    t.decimal "food_price"
    t.decimal "parking_price"
    t.decimal "toll_price"
    t.decimal "fixed_asset_price"
    t.decimal "misc_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_monthly_approval_id"
  end

  create_table "file_uploads", force: :cascade do |t|
    t.string "upload_document"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_monthly_approval_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "company_id"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_staffs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_staffs_on_reset_password_token", unique: true
  end

  create_table "user_monthly_approvals", force: :cascade do |t|
    t.date "created"
    t.string "status", default: "new"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "staff_id"
    t.integer "admin_id"
    t.string "date"
    t.decimal "grand_total"
  end

end
