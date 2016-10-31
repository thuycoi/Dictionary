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

ActiveRecord::Schema.define(version: 20161031125813) do

  create_table "g_comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "gword_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gword_id"], name: "index_g_comments_on_gword_id"
    t.index ["user_id"], name: "index_g_comments_on_user_id"
  end

  create_table "gwords", force: :cascade do |t|
    t.string   "entry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "translations", force: :cascade do |t|
    t.text     "explain"
    t.boolean  "like"
    t.integer  "gword_id"
    t.integer  "vword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gword_id"], name: "index_translations_on_gword_id"
    t.index ["vword_id"], name: "index_translations_on_vword_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 30
    t.string   "email"
    t.string   "password"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "v_comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "vword_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_v_comments_on_user_id"
    t.index ["vword_id"], name: "index_v_comments_on_vword_id"
  end

  create_table "vwords", force: :cascade do |t|
    t.string   "entry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
