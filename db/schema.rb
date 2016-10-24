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

ActiveRecord::Schema.define(version: 20161024205453) do

  create_table "GWords", force: :cascade do |t|
    t.string   "Word"
    t.string   "Translate"
    t.text     "Explanation"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "fav"
  end

  create_table "g_words", force: :cascade do |t|
    t.string   "entry"
    t.boolean  "favourite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "translations", force: :cascade do |t|
    t.integer  "Gword_id"
    t.integer  "VWord_id"
    t.boolean  "favourite"
    t.string   "example"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Gword_id"], name: "index_translations_on_Gword_id"
    t.index ["VWord_id"], name: "index_translations_on_VWord_id"
  end

  create_table "v_words", force: :cascade do |t|
    t.string   "entry"
    t.boolean  "favourite"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
