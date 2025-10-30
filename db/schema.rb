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

ActiveRecord::Schema[8.1].define(version: 2025_10_30_153924) do
  create_table "lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.integer "list_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_notes_on_list_id"
  end

  create_table "notes_tasks", id: false, force: :cascade do |t|
    t.integer "note_id", null: false
    t.integer "task_id", null: false
    t.index ["note_id", "task_id"], name: "index_notes_tasks_on_note_id_and_task_id"
    t.index ["task_id", "note_id"], name: "index_notes_tasks_on_task_id_and_note_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.date "due_date"
    t.integer "list_id", null: false
    t.integer "priority"
    t.string "status"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_tasks_on_list_id"
  end

  add_foreign_key "notes", "lists"
  add_foreign_key "tasks", "lists"
end
