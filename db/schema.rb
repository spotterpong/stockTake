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

ActiveRecord::Schema.define(version: 20160101225624) do

  create_table "comments", force: :cascade do |t|
    t.string   "comment_body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "home_phone"
    t.integer  "mobile_phone"
    t.boolean  "patch_test"
    t.datetime "patch_test_time"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
  end

  create_table "stocks", force: :cascade do |t|
    t.string   "barcode"
    t.text     "name"
    t.text     "description"
    t.integer  "quantity"
    t.float    "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

end
