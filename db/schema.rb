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

ActiveRecord::Schema.define(version: 20140509211528) do

  create_table "activities", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lession_id"
  end

  create_table "answers", force: true do |t|
    t.integer  "option_id"
    t.integer  "user_id"
    t.integer  "lession_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "word_id"
    t.integer  "category_id"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lession_words", force: true do |t|
    t.integer  "lession_id"
    t.integer  "word_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lession_words", ["lession_id", "word_id"], name: "index_lession_words_on_lession_id_and_word_id", unique: true

  create_table "lessions", force: true do |t|
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "user_id"
  end

  create_table "options", force: true do |t|
    t.integer  "word_id"
    t.string   "text"
    t.boolean  "is_correct", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "words", force: true do |t|
    t.integer  "status"
    t.string   "character"
    t.string   "meaning"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
