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

ActiveRecord::Schema[7.0].define(version: 2022_11_23_204249) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "euclid_results", force: :cascade do |t|
    t.integer "first"
    t.integer "second"
    t.integer "gcd"
    t.integer "lcm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first", "second"], name: "index_euclid_results_on_first_and_second", unique: true
  end

  create_table "euclid_steps", force: :cascade do |t|
    t.integer "step"
    t.integer "first"
    t.integer "second"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "euclid_result_id"
  end

  add_foreign_key "euclid_steps", "euclid_results"
end
