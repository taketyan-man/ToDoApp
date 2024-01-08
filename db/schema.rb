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

ActiveRecord::Schema[7.0].define(version: 2024_01_08_143349) do
  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "to_do_id", null: false
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["to_do_id"], name: "index_comments_on_to_do_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "fights", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "to_do_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["to_do_id"], name: "index_fights_on_to_do_id"
    t.index ["user_id"], name: "index_fights_on_user_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "comment_id", null: false
    t.integer "to_do_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_reports_on_comment_id"
    t.index ["to_do_id"], name: "index_reports_on_to_do_id"
  end

  create_table "to_dos", force: :cascade do |t|
    t.string "text"
    t.integer "user_id", null: false
    t.date "limit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "done"
    t.integer "fight"
    t.integer "comment"
    t.index ["user_id"], name: "index_to_dos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "to_dos"
  add_foreign_key "comments", "users"
  add_foreign_key "fights", "to_dos"
  add_foreign_key "fights", "users"
  add_foreign_key "reports", "comments"
  add_foreign_key "reports", "to_dos"
  add_foreign_key "to_dos", "users"
end
