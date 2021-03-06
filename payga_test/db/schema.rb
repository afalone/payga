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

ActiveRecord::Schema.define(version: 20160913104243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "payga_receipts", force: :cascade do |t|
    t.integer  "payga_request_id"
    t.string   "type"
    t.string   "error_code"
    t.string   "error_message"
    t.text     "json_params"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "cmd"
  end

  add_index "payga_receipts", ["payga_request_id"], name: "index_payga_receipts_on_payga_request_id", using: :btree
  add_index "payga_receipts", ["type"], name: "index_payga_receipts_on_type", using: :btree

  create_table "payga_requests", force: :cascade do |t|
    t.integer  "payga_system_id"
    t.string   "type"
    t.decimal  "amount"
    t.text     "description"
    t.string   "lang"
    t.string   "page_view"
    t.text     "json_params"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "order"
    t.string   "form_url"
    t.string   "state"
    t.string   "callback_url"
    t.string   "success_url"
    t.string   "fail_url"
  end

  add_index "payga_requests", ["payga_system_id"], name: "index_payga_requests_on_payga_system_id", using: :btree
  add_index "payga_requests", ["state"], name: "index_payga_requests_on_state", using: :btree
  add_index "payga_requests", ["type"], name: "index_payga_requests_on_type", using: :btree

  create_table "payga_systems", force: :cascade do |t|
    t.boolean  "default"
    t.string   "base"
    t.string   "username"
    t.string   "password"
    t.text     "pathes"
    t.string   "merchant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "payga_systems", ["default"], name: "index_payga_systems_on_default", using: :btree
  add_index "payga_systems", ["merchant"], name: "index_payga_systems_on_merchant", using: :btree

  add_foreign_key "payga_receipts", "payga_requests"
  add_foreign_key "payga_requests", "payga_systems"
end
