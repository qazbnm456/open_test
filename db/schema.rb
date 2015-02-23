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

ActiveRecord::Schema.define(version: 20141122062710) do

  create_table "bugs", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "level",       default: 0
    t.string   "status",      default: "待審核"
    t.datetime "modify_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "request_id"
    t.integer  "award",       default: 0
    t.string   "url"
    t.string   "parameter_1"
    t.string   "parameter_2"
    t.string   "parameter_3"
  end

  create_table "news", force: true do |t|
    t.string   "messages"
    t.datetime "date"
  end

  create_table "permits", force: true do |t|
    t.string "status"
  end

  create_table "requests", force: true do |t|
    t.string   "title"
    t.string   "client"
    t.string   "description"
    t.string   "status",          default: "進行中"
    t.boolean  "interview",       default: false
    t.datetime "from"
    t.datetime "to"
    t.datetime "modify_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_money",     default: 0
    t.integer  "remaining_money", default: 0
  end

  create_table "urbs", force: true do |t|
    t.integer "user_id"
    t.integer "request_id"
    t.integer "permit_id"
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
    t.integer  "level",                  default: 0
    t.integer  "admin",                  default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
