# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150226213055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "scheme_id"
  end

  create_table "category_standards", force: true do |t|
    t.integer  "category_id"
    t.integer  "standard_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_standards", ["category_id", "standard_id"], name: "index_category_standards_on_category_id_and_standard_id", unique: true, using: :btree
  add_index "category_standards", ["category_id"], name: "index_category_standards_on_category_id", using: :btree
  add_index "category_standards", ["standard_id"], name: "index_category_standards_on_standard_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.string   "website"
    t.string   "poc_name"
    t.string   "poc_title"
    t.string   "poc_phone"
    t.string   "poc_email"
    t.integer  "invoice_amt"
    t.string   "invoice_freq"
    t.string   "invoice_month"
    t.string   "listing_number"
    t.date     "effective"
    t.date     "updated"
    t.date     "expires"
    t.boolean  "suspended"
    t.boolean  "delisted"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "facilities", force: true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.string   "poc_name"
    t.string   "poc_phone"
    t.string   "poc_email"
    t.boolean  "inactive"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facilities", ["client_id"], name: "index_facilities_on_client_id", using: :btree

  create_table "invoices", force: true do |t|
    t.string   "number"
    t.integer  "client_id"
    t.string   "description"
    t.float    "amount"
    t.date     "date_invoiced"
    t.date     "date_paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invoices", ["client_id"], name: "index_invoices_on_client_id", using: :btree

  create_table "schemes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "standards", force: true do |t|
    t.string   "number"
    t.string   "revision"
    t.string   "title"
    t.string   "exceptions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
