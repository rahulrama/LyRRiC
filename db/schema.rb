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

ActiveRecord::Schema.define(version: 20160608111525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "statements", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "statements", ["user_id"], name: "index_statements_on_user_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "statement_id"
    t.integer  "tag_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "taggings", ["statement_id"], name: "index_taggings_on_statement_id", using: :btree
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "user_name"
    t.integer  "statement_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["statement_id"], name: "index_users_on_statement_id", using: :btree
  add_index "users", ["user_name"], name: "index_users_on_user_name", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.boolean  "verdict"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "statement_id"
    t.integer  "user_id"
  end

  add_index "votes", ["statement_id"], name: "index_votes_on_statement_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "statements", "users"
  add_foreign_key "taggings", "statements"
  add_foreign_key "taggings", "tags"
  add_foreign_key "users", "statements"
  add_foreign_key "votes", "statements"
  add_foreign_key "votes", "users"
end
