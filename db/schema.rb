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

ActiveRecord::Schema.define(version: 20160308103320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "name",                     null: false
    t.string   "email",                    null: false
    t.text     "body",                     null: false
    t.integer  "task_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "attachments", default: [],              array: true
  end

  add_index "comments", ["task_id"], name: "index_comments_on_task_id", using: :btree

  create_table "fileuploaders", force: :cascade do |t|
    t.string   "attachment"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fileuploaders", ["project_id"], name: "index_fileuploaders_on_project_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.integer  "project_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "attachments", default: [],              array: true
    t.text     "content"
    t.string   "user"
  end

  add_index "notes", ["project_id"], name: "index_notes_on_project_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id"
    t.datetime "end_date"
    t.datetime "start_date"
    t.string   "attachments", default: [],              array: true
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.boolean  "done"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id", using: :btree

  create_table "uploadfiles", force: :cascade do |t|
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "tasks"
  add_foreign_key "fileuploaders", "projects"
  add_foreign_key "notes", "projects"
  add_foreign_key "tasks", "projects"
end
