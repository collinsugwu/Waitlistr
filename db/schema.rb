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

ActiveRecord::Schema.define(version: 2022_01_29_210646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at", precision: 6
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "stock_alerts", force: :cascade do |t|
    t.bigint "stock_symbol_id"
    t.integer "high"
    t.integer "low"
    t.integer "close"
    t.datetime "date", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stock_symbol_id"], name: "index_stock_alerts_on_stock_symbol_id"
  end

  create_table "stock_symbols", force: :cascade do |t|
    t.bigint "wallet_id"
    t.string "name"
    t.integer "high"
    t.integer "low"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["name"], name: "index_stock_symbols_on_name", unique: true
    t.index ["slug"], name: "index_stock_symbols_on_slug", unique: true
    t.index ["wallet_id"], name: "index_stock_symbols_on_wallet_id"
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "stock_alerts", "stock_symbols"
  add_foreign_key "stock_symbols", "wallets"
end
