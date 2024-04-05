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

ActiveRecord::Schema[7.0].define(version: 2024_04_05_161659) do
  create_table "comments", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "to_do_id", null: false
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["to_do_id"], name: "index_comments_on_to_do_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  add_foreign_key "comments", "to_dos"
  add_foreign_key "comments", "users"
end
