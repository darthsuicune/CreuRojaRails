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

ActiveRecord::Schema.define(version: 20140718084249) do

  create_table "issues", force: true do |t|
    t.string   "status"
    t.string   "severity"
    t.string   "short_description"
    t.string   "long_description"
    t.string   "component"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_users", force: true do |t|
    t.integer  "location_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "location_users", ["location_id", "user_id"], name: "index_location_users_on_location_id_and_user_id", unique: true

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "address"
    t.string   "phone"
    t.float    "latitude",      limit: 24
    t.float    "longitude",     limit: 24
    t.string   "location_type"
    t.boolean  "active",                   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "expiredate"
  end

  add_index "locations", ["latitude", "longitude"], name: "index_locations_on_latitude_and_longitude", unique: true
  add_index "locations", ["name"], name: "index_locations_on_name"

  create_table "logs", force: true do |t|
    t.integer  "user_id"
    t.string   "action"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "controller"
  end

  add_index "logs", ["action"], name: "index_logs_on_action"
  add_index "logs", ["controller"], name: "index_logs_on_controller"
  add_index "logs", ["ip"], name: "index_logs_on_ip"
  add_index "logs", ["user_id"], name: "index_logs_on_user_id"

  create_table "services", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "assembly_id"
    t.datetime "base_time"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["assembly_id"], name: "index_services_on_assembly_id"

  create_table "sessions", force: true do |t|
    t.integer  "user_id"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["token"], name: "index_sessions_on_token", unique: true

  create_table "user_types", id: false, force: true do |t|
    t.integer  "user_id"
    t.string   "user_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_types", ["user_id", "user_type"], name: "index_user_types_on_user_id_and_user_type", unique: true

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "resettoken"
    t.datetime "resettime"
    t.string   "language"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",          default: true
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["resettoken"], name: "index_users_on_resettoken", unique: true

  create_table "vehicle_services", force: true do |t|
    t.integer  "vehicle_id"
    t.integer  "service_id"
    t.integer  "doc"
    t.integer  "due"
    t.integer  "tes"
    t.integer  "ci"
    t.integer  "asi"
    t.integer  "btp"
    t.integer  "b1"
    t.integer  "acu"
    t.integer  "per"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicle_services", ["vehicle_id", "service_id"], name: "index_vehicle_services_on_vehicle_id_and_service_id", unique: true

  create_table "vehicles", force: true do |t|
    t.string   "brand"
    t.string   "model"
    t.string   "license"
    t.string   "indicative"
    t.string   "vehicle_type"
    t.integer  "places"
    t.string   "notes"
    t.boolean  "operative",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vehicles", ["indicative"], name: "index_vehicles_on_indicative"
  add_index "vehicles", ["license"], name: "index_vehicles_on_license"
  add_index "vehicles", ["vehicle_type"], name: "index_vehicles_on_vehicle_type"

end
