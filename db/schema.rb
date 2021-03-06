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

ActiveRecord::Schema.define(version: 20200104162539) do

  create_table "budgets", force: :cascade do |t|
    t.date "ym"
    t.integer "pay_classification_id"
    t.integer "pay_amount"
    t.integer "income_classification_id"
    t.integer "income_amount"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["income_classification_id"], name: "index_budgets_on_income_classification_id"
    t.index ["pay_classification_id"], name: "index_budgets_on_pay_classification_id"
    t.index ["user_id"], name: "index_budgets_on_user_id"
  end

  create_table "income_classifications", force: :cascade do |t|
    t.string "name"
    t.integer "order_seq"
    t.boolean "default_sgn"
    t.boolean "list_sgn"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_income_classifications_on_user_id"
  end

  create_table "jounal_entries", force: :cascade do |t|
    t.date "ymd"
    t.integer "pay_amount"
    t.integer "pay_classification_id"
    t.integer "income_amount"
    t.integer "income_classification_id"
    t.integer "wallet_id"
    t.text "remarks"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["income_classification_id"], name: "index_jounal_entries_on_income_classification_id"
    t.index ["pay_classification_id"], name: "index_jounal_entries_on_pay_classification_id"
    t.index ["user_id"], name: "index_jounal_entries_on_user_id"
    t.index ["wallet_id"], name: "index_jounal_entries_on_wallet_id"
  end

  create_table "pay_classifications", force: :cascade do |t|
    t.string "name"
    t.integer "order_seq"
    t.boolean "default_sgn"
    t.boolean "list_sgn"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pay_classifications_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "login_id", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login_id"], name: "index_users_on_login_id", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.string "name"
    t.integer "balance"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

end
