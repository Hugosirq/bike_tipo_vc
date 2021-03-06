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

ActiveRecord::Schema.define(version: 20180312003124) do

  create_table "bikes", force: :cascade do |t|
    t.string "code", null: false
    t.integer "condition_cd", null: false
    t.string "locable_type", null: false
    t.integer "locable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locable_id"], name: "index_bikes_on_locable_id"
    t.index ["locable_type"], name: "index_bikes_on_locable_type"
  end

  create_table "stations", force: :cascade do |t|
    t.string "description", null: false
    t.string "address"
    t.string "neighborhood"
    t.integer "max_capacity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.string "user_id", null: false
    t.integer "origin_station_id", null: false
    t.integer "final_station_id"
    t.integer "bike_id", null: false
    t.decimal "meters_distance", precision: 5, scale: 2
    t.datetime "start_date", null: false
    t.datetime "end_date"
    t.integer "extra_minutes"
    t.decimal "pricing", precision: 4, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bike_id"], name: "index_trips_on_bike_id"
    t.index ["final_station_id"], name: "index_trips_on_final_station_id"
    t.index ["origin_station_id"], name: "index_trips_on_origin_station_id"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
