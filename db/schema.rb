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

ActiveRecord::Schema.define(version: 20170506112952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "availables", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_availables_on_branch_id", using: :btree
    t.index ["item_id"], name: "index_availables_on_item_id", using: :btree
  end

  create_table "belongs", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_belongs_on_category_id", using: :btree
    t.index ["item_id"], name: "index_belongs_on_item_id", using: :btree
  end

  create_table "billing_infos", force: :cascade do |t|
    t.string   "BillingInfoCardNumber", limit: 16
    t.string   "BillingInfoCvv",        limit: 3
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "billingInfoExp"
    t.index ["user_id"], name: "index_billing_infos_on_user_id", using: :btree
  end

  create_table "branches", force: :cascade do |t|
    t.string   "branchName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "categoryName"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "color_items", force: :cascade do |t|
    t.integer  "color_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["color_id"], name: "index_color_items_on_color_id", using: :btree
    t.index ["item_id"], name: "index_color_items_on_item_id", using: :btree
  end

  create_table "colors", force: :cascade do |t|
    t.string   "colorvalue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "has_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_has_items_on_item_id", using: :btree
    t.index ["order_id"], name: "index_has_items_on_order_id", using: :btree
  end

  create_table "items", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "itemsize"
    t.string   "itemmodel"
    t.integer  "itemstockqty"
    t.float    "itemprice"
    t.string   "itemdescription"
    t.string   "itemPhoto"
    t.integer  "branch_id"
    t.boolean  "inOrder",         default: false, null: false
    t.index ["branch_id"], name: "index_items_on_branch_id", using: :btree
    t.index ["created_at", "itemprice", "itemsize"], name: "index_items_on_created_at_and_itemprice_and_itemsize", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "orderStatus",  default: 0
    t.float    "orderInvoice"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["orderStatus"], name: "index_orders_on_orderStatus", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.float    "paymentAmount"
    t.integer  "paymentType",     default: 0
    t.integer  "billing_info_id"
    t.integer  "order_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["billing_info_id"], name: "index_payments_on_billing_info_id", using: :btree
    t.index ["order_id"], name: "index_payments_on_order_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: "",    null: false
    t.string   "encrypted_password",                default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "authentication_token",   limit: 30
    t.boolean  "admin",                             default: false, null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "useraddress"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "availables", "branches"
  add_foreign_key "availables", "items"
  add_foreign_key "belongs", "categories"
  add_foreign_key "belongs", "items"
  add_foreign_key "billing_infos", "users"
  add_foreign_key "color_items", "colors"
  add_foreign_key "color_items", "items"
  add_foreign_key "has_items", "items"
  add_foreign_key "has_items", "orders"
  add_foreign_key "items", "branches"
  add_foreign_key "items", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "billing_infos"
  add_foreign_key "payments", "orders"
end
