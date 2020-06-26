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

ActiveRecord::Schema.define(version: 2020_06_26_013749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "postalcode"
    t.string "countrycode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "registrant_id"
    t.index ["registrant_id"], name: "index_addresses_on_registrant_id"
  end

  create_table "domains", force: :cascade do |t|
    t.string "name"
    t.datetime "registration_date"
    t.datetime "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postal_infos", force: :cascade do |t|
    t.string "name"
    t.string "organization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "registrant_id"
    t.index ["registrant_id"], name: "index_postal_infos_on_registrant_id"
  end

  create_table "prices", force: :cascade do |t|
    t.string "pricecurrency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "domain_id"
    t.string "price_cents"
  end

  create_table "registrants", force: :cascade do |t|
    t.string "voice"
    t.string "fax"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
    t.integer "payment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "registrants"
  add_foreign_key "domains", "orders"
  add_foreign_key "postal_infos", "registrants"
  add_foreign_key "prices", "domains"
  add_foreign_key "transactions", "orders"
end
