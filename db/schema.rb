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

ActiveRecord::Schema.define(version: 20160615083612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
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

  create_table "balconies", force: :cascade do |t|
    t.string   "name"
    t.string   "model"
    t.string   "address"
    t.string   "city"
    t.integer  "department"
    t.integer  "length"
    t.integer  "width"
    t.string   "photo"
    t.integer  "storey"
    t.string   "orientation"
    t.string   "house_type"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "balconies", ["user_id"], name: "index_balconies_on_user_id", using: :btree

  create_table "balconies_items", id: false, force: :cascade do |t|
    t.integer "balcony_id"
    t.integer "item_id"
  end

  add_index "balconies_items", ["balcony_id"], name: "index_balconies_items_on_balcony_id", using: :btree
  add_index "balconies_items", ["item_id"], name: "index_balconies_items_on_item_id", using: :btree

  create_table "departments", force: :cascade do |t|
    t.integer  "number"
    t.integer  "temperature_min"
    t.integer  "temperature_max"
    t.integer  "pluviometry"
    t.integer  "sunshine_amount"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "category"
    t.string   "sub_category"
    t.string   "plant_category"
    t.integer  "slot"
    t.integer  "price"
    t.integer  "volume"
    t.integer  "length"
    t.integer  "width"
    t.integer  "weight"
    t.string   "photo"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "items_plants", id: false, force: :cascade do |t|
    t.integer "item_id"
    t.integer "plant_id"
  end

  add_index "items_plants", ["item_id"], name: "index_items_plants_on_item_id", using: :btree
  add_index "items_plants", ["plant_id"], name: "index_items_plants_on_plant_id", using: :btree

  create_table "plants", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "category"
    t.integer  "temperature_min"
    t.integer  "temperature_max"
    t.integer  "pluviometry"
    t.integer  "sunshine_amount"
    t.string   "scientific_name"
    t.integer  "fertiliser"
    t.text     "advises"
    t.integer  "price"
    t.integer  "slot"
    t.string   "photo"
    t.string   "color"
    t.string   "size"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false, null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "picture"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "balconies", "users"
end
