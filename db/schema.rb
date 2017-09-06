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

ActiveRecord::Schema.define(version: 20170906130434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "serial"
    t.integer  "academy_id"
  end

  create_table "logs", force: :cascade do |t|
    t.string   "lender_id"
    t.text     "borrower_id"
    t.string   "returned_to_id"
    t.date     "return_date"
    t.text     "notes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "item_id"
    t.date     "due_date"
    t.index ["item_id"], name: "index_logs_on_item_id", using: :btree
    t.index ["lender_id"], name: "index_logs_on_lender_id", using: :btree
  end

  add_foreign_key "logs", "items"
end
