# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_220_816_142_736) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "cube"
  enable_extension "earthdistance"
  enable_extension "plpgsql"

  create_table "experiences", force: :cascade do |t|
    t.bigint "partner_id", null: false
    t.bigint "material_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_experiences_on_material_id"
    t.index ["partner_id"], name: "index_experiences_on_partner_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", force: :cascade do |t|
    t.integer "rating"
    t.integer "operating_radius"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "lng", precision: 10, scale: 6
    t.decimal "lat", precision: 10, scale: 6
  end

  create_table "requests", force: :cascade do |t|
    t.string "phone_number"
    t.integer "area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
  end

  create_table "requirements", force: :cascade do |t|
    t.bigint "request_id", null: false
    t.bigint "material_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_id"], name: "index_requirements_on_material_id"
    t.index ["request_id"], name: "index_requirements_on_request_id"
  end

  add_foreign_key "experiences", "materials"
  add_foreign_key "experiences", "partners"
  add_foreign_key "requirements", "materials"
  add_foreign_key "requirements", "requests"
end
