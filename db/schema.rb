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

ActiveRecord::Schema.define(version: 20160614065935) do

  create_table "space_properties", force: :cascade do |t|
    t.string   "space_id"
    t.string   "type"
    t.string   "sso_enabled"
    t.string   "processing_timezone"
    t.float    "process_engine_version"
    t.string   "push_down_to_db"
    t.string   "allow_usage_stats"
    t.string   "dynamic_groups_for_access"
    t.string   "lock_packages"
    t.integer  "min_years"
    t.integer  "max_years"
    t.string   "map_nulls_to_0"
    t.string   "email_from"
    t.string   "email_subject"
    t.text     "comments"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "space_variables", force: :cascade do |t|
    t.string   "space_id"
    t.string   "name"
    t.string   "value"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spaces", force: :cascade do |t|
    t.string   "space_id"
    t.string   "name"
    t.string   "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
