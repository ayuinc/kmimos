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

ActiveRecord::Schema.define(version: 20151015221204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "additional_services", force: true do |t|
    t.integer  "service_id"
    t.integer  "provider_id"
    t.integer  "size_id"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_users", force: true do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "ages", force: true do |t|
    t.string "age_group_name"
  end

  create_table "agings", force: true do |t|
    t.integer "provider_id"
    t.integer "age_id"
  end

  create_table "bookings", force: true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "provider_id"
    t.string   "user_first_name"
    t.string   "user_last_name"
    t.string   "user_phone"
    t.string   "user_email"
    t.string   "user_message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ref_code"
    t.string   "raza"
    t.string   "edad"
    t.text     "cuidado_especial"
    t.string   "token"
    t.string   "address"
    t.datetime "pickup_time"
    t.datetime "dropoff_time"
    t.string   "pet_name"
  end

  add_index "bookings", ["provider_id"], name: "index_bookings_on_provider_id", using: :btree

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "locale"
    t.string   "currency"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "flag"
    t.string   "domain"
    t.integer  "dni_length"
    t.string   "dni_label"
  end

  create_table "localizations", force: true do |t|
    t.integer "provider_id"
    t.integer "location_id"
  end

  add_index "localizations", ["location_id"], name: "index_localizations_on_location_id", using: :btree
  add_index "localizations", ["provider_id"], name: "index_localizations_on_provider_id", using: :btree

  create_table "locations", force: true do |t|
    t.string  "name"
    t.integer "state_id"
    t.string  "utf_name"
  end

  create_table "meetings", force: true do |t|
    t.integer "provider_id"
    t.string  "user_first_name"
    t.string  "user_last_name"
    t.string  "user_phone"
    t.string  "user_email"
    t.string  "token"
  end

  add_index "meetings", ["provider_id"], name: "index_meetings_on_provider_id", using: :btree

  create_table "own_sizings", force: true do |t|
    t.integer  "provider_id"
    t.integer  "size_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pet_behaviors", force: true do |t|
    t.string   "behavior_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: true do |t|
    t.string "property_name"
  end

  create_table "provider_attachments", force: true do |t|
    t.integer  "provider_id"
    t.string   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.string   "name"
    t.string   "last_name_1"
    t.string   "last_name_2"
    t.string   "dni"
    t.string   "email"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.float    "avg_rating"
    t.string   "phone"
    t.text     "description"
    t.string   "email_c"
    t.string   "avatar"
    t.float    "price"
    t.string   "areas_externas"
    t.boolean  "emergencia"
    t.integer  "experiencia"
    t.text     "iframe_code"
    t.integer  "property_id"
    t.boolean  "active",                 default: true
    t.string   "latitude"
    t.string   "longitude"
    t.string   "address"
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.boolean  "has_other_pets"
    t.integer  "number_of_pets"
    t.integer  "pets_allowed"
    t.boolean  "has_green"
    t.boolean  "has_yard"
    t.integer  "pet_behavior_id"
  end

  add_index "providers", ["category_id"], name: "index_providers_on_category_id", using: :btree
  add_index "providers", ["email"], name: "index_providers_on_email", unique: true, using: :btree
  add_index "providers", ["reset_password_token"], name: "index_providers_on_reset_password_token", unique: true, using: :btree

  create_table "referrals", force: true do |t|
    t.string   "code_value"
    t.string   "referrer_name"
    t.string   "referrer_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "service_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sizes", force: true do |t|
    t.string "size_title"
  end

  create_table "sizings", force: true do |t|
    t.integer "provider_id"
    t.integer "size_id"
    t.integer "additional_service_id"
  end

  create_table "states", force: true do |t|
    t.string  "name"
    t.integer "country_id"
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree

  create_table "users", force: true do |t|
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
