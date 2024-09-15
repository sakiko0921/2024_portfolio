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

ActiveRecord::Schema[7.2].define(version: 2024_09_15_134539) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_necessities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.index ["user_id"], name: "index_daily_necessities_on_user_id"
  end

  create_table "daily_necessity_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "daily_necessity_id", null: false
    t.bigint "shopping_list_id", null: false
    t.integer "quantity", default: 0
    t.integer "unit", default: 0
    t.index ["daily_necessity_id"], name: "index_daily_necessity_items_on_daily_necessity_id"
    t.index ["shopping_list_id"], name: "index_daily_necessity_items_on_shopping_list_id"
  end

  create_table "food_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_id", null: false
    t.bigint "shopping_list_id", null: false
    t.decimal "quantity", precision: 5, scale: 2, default: "0.0"
    t.integer "unit", default: 0
    t.index ["food_id"], name: "index_food_items_on_food_id"
    t.index ["shopping_list_id"], name: "index_food_items_on_shopping_list_id"
  end

  create_table "foods", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.decimal "protein", precision: 5, scale: 1, null: false
    t.decimal "fat", precision: 5, scale: 1, null: false
    t.decimal "carbohydrate", precision: 5, scale: 1, null: false
    t.integer "favorite", default: 0
  end

  create_table "member_infos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "weight", null: false
    t.integer "height", null: false
    t.string "name", null: false
    t.string "age", null: false
    t.bigint "user_id", null: false
    t.integer "gender", default: 0
    t.index ["user_id"], name: "index_member_infos_on_user_id"
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "stocking_days", default: 1, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_shopping_lists_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password", null: false
    t.string "salt"
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "daily_necessities", "users"
  add_foreign_key "daily_necessity_items", "daily_necessities"
  add_foreign_key "daily_necessity_items", "shopping_lists"
  add_foreign_key "food_items", "foods"
  add_foreign_key "food_items", "shopping_lists"
  add_foreign_key "member_infos", "users"
  add_foreign_key "shopping_lists", "users"
end
