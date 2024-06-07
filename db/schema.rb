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

ActiveRecord::Schema[7.1].define(version: 2024_06_07_003527) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.text "address"
    t.string "mail"
    t.string "phone", limit: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "role", limit: 1, default: "N", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone", limit: 8
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "employee_id", null: false
    t.float "total"
    t.string "status", limit: 1, default: "P"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["employee_id"], name: "index_orders_on_employee_id"
  end

  create_table "pizza_details", force: :cascade do |t|
    t.bigint "pizza_part_id", null: false
    t.bigint "order_id", null: false
    t.float "unit_price"
    t.float "quantity"
    t.float "sub_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_pizza_details_on_order_id"
    t.index ["pizza_part_id"], name: "index_pizza_details_on_pizza_part_id"
  end

  create_table "pizza_part_translations", force: :cascade do |t|
    t.bigint "pizza_part_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.index ["locale"], name: "index_pizza_part_translations_on_locale"
    t.index ["pizza_part_id"], name: "index_pizza_part_translations_on_pizza_part_id"
  end

  create_table "pizza_parts", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price", null: false
    t.string "category", limit: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_details", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.float "unit_price"
    t.integer "quantity"
    t.float "sub_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_product_details_on_order_id"
    t.index ["product_id"], name: "index_product_details_on_product_id"
  end

  create_table "product_translations", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.index ["locale"], name: "index_product_translations_on_locale"
    t.index ["product_id"], name: "index_product_translations_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price", null: false
    t.integer "stock", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "orders", "customers"
  add_foreign_key "orders", "employees"
  add_foreign_key "pizza_details", "orders"
  add_foreign_key "pizza_details", "pizza_parts"
  add_foreign_key "product_details", "orders"
  add_foreign_key "product_details", "products"
end
