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

ActiveRecord::Schema.define(version: 20170929115047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "third_party_vendor_id"
    t.string   "name"
    t.float    "total"
    t.float    "unpaid"
    t.float    "paid"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["company_id"], name: "index_accounts_on_company_id", using: :btree
    t.index ["third_party_vendor_id"], name: "index_accounts_on_third_party_vendor_id", using: :btree
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employees_on_company_id", using: :btree
    t.index ["user_id"], name: "index_employees_on_user_id", using: :btree
  end

  create_table "flight_informations", force: :cascade do |t|
    t.string   "name"
    t.string   "source"
    t.string   "destination"
    t.string   "source_code"
    t.string   "destination_code"
    t.float    "amount"
    t.boolean  "two_way"
    t.date     "journey_date"
    t.datetime "journey_time"
    t.float    "travel_time"
    t.boolean  "refundable"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "third_party_vendor_id"
    t.string   "type"
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "reportee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["employee_id", "reportee_id"], name: "index_matches_on_employee_id_and_reportee_id", unique: true, using: :btree
    t.index ["employee_id"], name: "index_matches_on_employee_id", using: :btree
    t.index ["reportee_id"], name: "index_matches_on_reportee_id", using: :btree
  end

  create_table "my_accounts", force: :cascade do |t|
    t.float    "total_earning"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "third_party_employees", force: :cascade do |t|
    t.integer  "third_party_vendor_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "user_id"
    t.index ["third_party_vendor_id"], name: "index_third_party_employees_on_third_party_vendor_id", using: :btree
  end

  create_table "third_party_vendors", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_third_party_vendors_on_company_id", using: :btree
  end

  create_table "tokens", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "transaction_token"
    t.datetime "transaction_token_created_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "state"
    t.string   "otp_secret_key"
    t.index ["employee_id"], name: "index_tokens_on_employee_id", using: :btree
  end

  create_table "transaction_details", force: :cascade do |t|
    t.integer  "transact_id"
    t.integer  "transaction_id"
    t.string   "type"
    t.string   "source"
    t.string   "destination"
    t.float    "amount"
    t.boolean  "confirmed"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["transact_id"], name: "index_transaction_details_on_transact_id", using: :btree
  end

  create_table "transacts", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "token_id"
    t.integer  "company_id"
    t.integer  "third_party_vendor_id"
    t.string   "transaction_token"
    t.datetime "transaction_token_created_at"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["company_id"], name: "index_transacts_on_company_id", using: :btree
    t.index ["employee_id"], name: "index_transacts_on_employee_id", using: :btree
    t.index ["third_party_vendor_id"], name: "index_transacts_on_third_party_vendor_id", using: :btree
    t.index ["token_id"], name: "index_transacts_on_token_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",               default: "email", null: false
    t.string   "uid",                    default: "",      null: false
    t.string   "password_digest",        default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.string   "type"
    t.json     "tokens"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  add_foreign_key "accounts", "companies"
  add_foreign_key "accounts", "third_party_vendors"
  add_foreign_key "employees", "companies"
  add_foreign_key "employees", "users"
  add_foreign_key "matches", "employees"
  add_foreign_key "matches", "employees", column: "reportee_id"
  add_foreign_key "third_party_employees", "third_party_vendors"
  add_foreign_key "third_party_vendors", "companies"
  add_foreign_key "tokens", "employees"
  add_foreign_key "transaction_details", "transacts"
  add_foreign_key "transacts", "companies"
  add_foreign_key "transacts", "employees"
  add_foreign_key "transacts", "third_party_vendors"
  add_foreign_key "transacts", "tokens"
end
