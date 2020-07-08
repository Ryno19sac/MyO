# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_25_214147) do

  create_table "birthdays", force: :cascade do |t|
    t.date "current_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "journals", force: :cascade do |t|
    t.string "entry"
    t.integer "user_id"
    t.string "entryDate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_journals_on_user_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "quote"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "rituals", force: :cascade do |t|
    t.string "ritualTitle"
    t.boolean "is_done_for_the_day"
    t.boolean "editing", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_rituals_on_user_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.boolean "is_completed", default: false
    t.boolean "editing", default: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "journals", "users"
  add_foreign_key "quotes", "users"
  add_foreign_key "rituals", "users"
  add_foreign_key "todos", "users"
end
