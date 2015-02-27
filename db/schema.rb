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

ActiveRecord::Schema.define(version: 20150227083522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cases", force: true do |t|
    t.integer  "service_id"
    t.text     "blurb"
    t.string   "subject"
    t.integer  "priority"
    t.text     "description"
    t.string   "status"
    t.datetime "remote_updated_at"
  end

  add_index "cases", ["service_id"], name: "index_cases_on_service_id", unique: true, using: :btree

  create_table "cases_filters", force: true do |t|
    t.integer "case_id"
    t.integer "filter_id"
  end

  create_table "cases_labels", force: true do |t|
    t.integer "case_id"
    t.integer "label_id"
  end

  create_table "filters", force: true do |t|
    t.integer "service_id"
    t.boolean "active"
    t.string  "name"
    t.integer "position"
  end

  add_index "filters", ["service_id"], name: "index_filters_on_service_id", unique: true, using: :btree

  create_table "labels", force: true do |t|
    t.string  "name"
    t.string  "description"
    t.integer "service_id"
  end

  add_index "labels", ["service_id"], name: "index_labels_on_service_id", unique: true, using: :btree

  create_table "messages", force: true do |t|
    t.integer  "case_id"
    t.text     "body"
    t.datetime "remote_created_at"
  end

  add_index "messages", ["case_id"], name: "index_messages_on_case_id", unique: true, using: :btree

end
