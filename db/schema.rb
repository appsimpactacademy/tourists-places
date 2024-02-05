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

ActiveRecord::Schema[7.0].define(version: 2024_02_05_105013) do
  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.text "description"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tourist_points", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "latitude"
    t.float "longitude"
    t.string "distance_from"
    t.string "city"
    t.string "state"
    t.string "image_url"
    t.integer "place_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_tourist_points_on_place_id"
  end

  add_foreign_key "tourist_points", "places"
end
