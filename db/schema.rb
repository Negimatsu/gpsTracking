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

ActiveRecord::Schema.define(version: 20140128141148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "car_styles", force: true do |t|
    t.string   "name"
    t.integer  "seat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cars", force: true do |t|
    t.integer  "way"
    t.string   "plate"
    t.string   "gps_name"
    t.integer  "car_style_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "list_stations", force: true do |t|
    t.integer  "list_number"
    t.integer  "station_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "next_time"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "stations", force: true do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "lng"
    t.integer  "station"
    t.integer  "nextStation"
    t.float    "x1"
    t.float    "y1"
    t.float    "x2"
    t.float    "y2"
    t.float    "x3"
    t.float    "y3"
    t.float    "x4"
    t.float    "y4"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "station_current_pic"
    t.string   "station_next_pic"
    t.string   "station_normal_pic"
  end

  create_table "trackings", force: true do |t|
    t.float    "lat"
    t.float    "long"
    t.integer  "car_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "station_id"
  end

  create_table "traffic_jams", force: true do |t|
    t.integer  "station_id"
    t.integer  "level"
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
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
