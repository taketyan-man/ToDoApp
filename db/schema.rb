# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2025_04_05_162014) do
  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "todo_id", null: false
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_id"], name: "index_comments_on_todo_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "fights", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "todo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_id"], name: "index_fights_on_todo_id"
    t.index ["user_id"], name: "index_fights_on_user_id"
  end

  create_table "notices", force: :cascade do |t|
    t.integer "receivor_id", null: false
    t.integer "sender_id", null: false
    t.integer "action"
    t.integer "action_id"
    t.boolean "checked"
    t.integer "todo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receivor_id"], name: "index_notices_on_receivor_id"
    t.index ["sender_id"], name: "index_notices_on_sender_id"
    t.index ["todo_id"], name: "index_notices_on_todo_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "comment_id", null: false
    t.integer "todo_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_reports_on_comment_id"
    t.index ["todo_id"], name: "index_reports_on_todo_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "text"
    t.integer "user_id", null: false
    t.date "limit_date"
    t.boolean "done", default: false
    t.integer "fight", default: 0
    t.integer "comment", default: 0
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "user_image"
    t.boolean "public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "todos"
  add_foreign_key "comments", "users"
  add_foreign_key "fights", "todos"
  add_foreign_key "fights", "users"
  add_foreign_key "notices", "users", column: "receivor_id"
  add_foreign_key "notices", "users", column: "sender_id"
  add_foreign_key "reports", "comments"
  add_foreign_key "reports", "todos"
  add_foreign_key "reports", "users"
  add_foreign_key "todos", "users"
end
