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

ActiveRecord::Schema[7.1].define(version: 2024_04_26_171920) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "species", null: false
    t.string "name", null: false
    t.integer "status"
    t.bigint "habitat_id"
    t.jsonb "dietary_requirements"
    t.jsonb "feeding_times"
    t.jsonb "tasks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["habitat_id"], name: "index_animals_on_habitat_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.integer "role"
    t.jsonb "tasks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "habitats", force: :cascade do |t|
    t.string "name", null: false
    t.jsonb "descriptors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.string "notable_type", null: false
    t.bigint "notable_id", null: false
    t.text "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_notes_on_employee_id"
    t.index ["notable_type", "notable_id"], name: "index_notes_on_notable"
  end

end
