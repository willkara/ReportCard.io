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

ActiveRecord::Schema.define(version: 20140924173318) do

  create_table "class_comments", force: true do |t|
    t.integer  "ru_class_id"
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "class_comments", ["ru_class_id"], name: "index_class_comments_on_ru_class_id"
  add_index "class_comments", ["user_id"], name: "index_class_comments_on_user_id"

  create_table "departments", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prof_class_maps", force: true do |t|
    t.integer  "ru_class_id"
    t.integer  "ru_professor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prof_comments", force: true do |t|
    t.integer  "ru_professor_id"
    t.integer  "user_id"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prof_comments", ["ru_professor_id"], name: "index_prof_comments_on_ru_professor_id"
  add_index "prof_comments", ["user_id"], name: "index_prof_comments_on_user_id"

  create_table "ru_classes", force: true do |t|
    t.string   "class_title"
    t.string   "class_code"
    t.string   "class_synopsis"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
  end

  add_index "ru_classes", ["department_id"], name: "index_ru_classes_on_department_id"

  create_table "ru_professors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "department"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
  end

  add_index "ru_professors", ["department_id"], name: "index_ru_professors_on_department_id"

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "summary"
    t.string   "address"
    t.integer  "phone"
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

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
