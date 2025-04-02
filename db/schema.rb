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

ActiveRecord::Schema[7.2].define(version: 2025_04_01_061205) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branch_fiscal_year_stats", force: :cascade do |t|
    t.string "fiscal_year", limit: 4, null: false
    t.bigint "branch_id", null: false
    t.integer "annual_working_days", null: false
    t.integer "annual_employee_count", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_branch_fiscal_year_stats_on_branch_id"
    t.index ["user_id"], name: "index_branch_fiscal_year_stats_on_user_id"
  end

  create_table "branches", force: :cascade do |t|
    t.string "name", null: false
    t.integer "workplace_type", null: false
    t.integer "city_category", null: false
    t.string "postcode"
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "address_line1"
    t.string "address_line2"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_branches_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "contact_name", null: false
    t.string "contact_email"
    t.integer "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_companies_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.boolean "admin", default: false, null: false
    t.bigint "company_id", null: false
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "branch_fiscal_year_stats", "branches"
  add_foreign_key "branch_fiscal_year_stats", "users"
  add_foreign_key "branches", "companies"
  add_foreign_key "users", "companies"
end
