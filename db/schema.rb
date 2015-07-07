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

ActiveRecord::Schema.define(version: 20150707165955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "offer_id"
    t.integer  "user_id"
    t.integer  "quantity"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bookings", ["offer_id"], name: "index_bookings_on_offer_id", using: :btree
  add_index "bookings", ["user_id"], name: "index_bookings_on_user_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compositions", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.string   "quantity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "compositions", ["ingredient_id"], name: "index_compositions_on_ingredient_id", using: :btree
  add_index "compositions", ["recipe_id"], name: "index_compositions_on_recipe_id", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "portion"
    t.datetime "startdate"
    t.datetime "enddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "price"
    t.string   "delay"
  end

  add_index "offers", ["recipe_id"], name: "index_offers_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "numberpers"
    t.text     "description"
    t.string   "cooktime"
    t.string   "preparationtime"
    t.integer  "price"
    t.boolean  "halal"
    t.boolean  "vegan"
    t.boolean  "vegetarian"
    t.boolean  "gluten"
    t.boolean  "lactose"
    t.boolean  "casher"
    t.boolean  "bio"
    t.integer  "category_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "rank"
  end

  add_index "recipes", ["category_id"], name: "index_recipes_on_category_id", using: :btree
  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birthdate"
    t.string   "phonenumber"
    t.string   "sex"
    t.string   "address"
    t.string   "city"
    t.string   "pseudo"
    t.boolean  "pepeato"
    t.text     "description"
    t.string   "delay"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bookings", "offers"
  add_foreign_key "bookings", "users"
  add_foreign_key "compositions", "ingredients"
  add_foreign_key "compositions", "recipes"
  add_foreign_key "offers", "recipes"
  add_foreign_key "recipes", "categories"
  add_foreign_key "recipes", "users"
end
