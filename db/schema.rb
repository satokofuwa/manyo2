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

ActiveRecord::Schema.define(version: 2022_05_07_143023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "labelings", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "label_id", null: false
    t.index ["label_id"], name: "index_labelings_on_label_id"
    t.index ["task_id"], name: "index_labelings_on_task_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "label_name"
    t.index ["label_name"], name: "index_labels_on_label_name", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title", null: false
    t.string "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "expired_at", default: "2022-01-01", null: false
    t.integer "status", default: 0, null: false
    t.string "user_id"
    t.integer "priority", default: 0, null: false
    t.index ["title"], name: "index_tasks_on_title"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.text "email", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["id"], name: "index_users_on_id"
  end

  add_foreign_key "labelings", "labels"
  add_foreign_key "labelings", "tasks"
end
