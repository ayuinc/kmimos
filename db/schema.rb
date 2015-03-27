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

ActiveRecord::Schema.define(version: 20150326212010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ages", force: true do |t|
    t.string  "age_group_name"
    t.integer "provider_id"
  end

  create_table "albums", force: true do |t|
    t.integer "provider_id"
  end

  add_index "albums", ["provider_id"], name: "index_albums_on_provider_id", using: :btree

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
  end

  add_index "bookings", ["provider_id"], name: "index_bookings_on_provider_id", using: :btree

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "localizations", force: true do |t|
    t.integer "provider_id"
    t.integer "location_id"
  end

  add_index "localizations", ["location_id"], name: "index_localizations_on_location_id", using: :btree
  add_index "localizations", ["provider_id"], name: "index_localizations_on_provider_id", using: :btree

  create_table "locations", force: true do |t|
    t.string "name"
  end

  create_table "photos", force: true do |t|
    t.integer "album_id"
    t.string  "image"
  end

  add_index "photos", ["album_id"], name: "index_photos_on_album_id", using: :btree

  create_table "pictures", force: true do |t|
    t.string   "image"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pictures", ["imageable_id", "imageable_type"], name: "index_pictures_on_imageable_id_and_imageable_type", using: :btree

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
  end

  add_index "providers", ["category_id"], name: "index_providers_on_category_id", using: :btree

  create_table "referrals", force: true do |t|
    t.string   "code_value"
    t.string   "referrer_name"
    t.string   "referrer_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sizes", force: true do |t|
    t.string  "size_title"
    t.integer "provider_id"
  end

end
