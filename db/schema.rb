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

ActiveRecord::Schema[7.1].define(version: 2024_02_10_075254) do
  create_table "admins", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "first_name", limit: 25
    t.string "last_name", limit: 30
    t.string "username", limit: 30
    t.string "email", limit: 40
    t.string "password_digest"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "carts", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_carts_on_product_id"
  end

  create_table "clients", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "gstNo"
    t.integer "pinCode"
    t.string "address"
    t.string "district"
    t.string "state"
    t.string "country"
    t.string "contactNo"
    t.string "email"
    t.string "whatsappNo"
    t.float "localRate"
    t.float "stateRate"
    t.float "nationalRate"
    t.float "internationalRate"
    t.string "adminId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "firstName"
    t.string "middleName"
    t.string "lastName"
    t.string "aadharNo"
    t.string "address"
    t.string "phoneNumber"
    t.string "dateOfBirth"
    t.string "dateOfJoining"
    t.string "employeeType"
    t.integer "adminId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "friends", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "phone"
    t.string "twitter"
    t.string "email"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mutual_friends", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.integer "phone"
    t.string "twitter"
    t.string "email"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "clientName"
    t.string "clientId"
    t.string "senderId"
    t.string "senderName"
    t.string "gstNo"
    t.string "senderPinCode"
    t.string "senderAddress"
    t.string "senderDistrict"
    t.string "senderState"
    t.string "senderCountry"
    t.string "senderContactNo"
    t.string "senderEmail"
    t.string "senderWhatsappNo"
    t.string "consigneeName"
    t.string "consigneePinCode"
    t.string "consigneeAddress"
    t.string "consigneeDistrict"
    t.string "consigneeState"
    t.string "consigneeCountry"
    t.string "consigneeContactNo"
    t.string "consigneeEmail"
    t.string "consigneeWhatsappNo"
    t.string "packageType"
    t.string "weight"
    t.string "amount"
    t.string "discount"
    t.string "totalAmount"
    t.string "employeeName"
    t.string "employeeId"
    t.integer "adminId"
    t.string "consignmentNo"
    t.text "sub_packages", size: :long, default: "[]", collation: "utf8mb4_bin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "json_valid(`sub_packages`)", name: "sub_packages"
  end

  create_table "products", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", id: :integer, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "first_name", limit: 25
    t.string "last_name", limit: 30
    t.string "username", limit: 30
    t.string "email", limit: 40
    t.string "password_digest"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "todos", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "title"
    t.string "status"
    t.boolean "is_completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "adminId"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users1", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at", precision: nil
    t.string "confirmation_token"
    t.datetime "confirmed_at", precision: nil
    t.datetime "confirmation_sent_at", precision: nil
    t.string "unconfirmed_email"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "carts", "products"
  add_foreign_key "employees", "users"
  add_foreign_key "todos", "users1", column: "user_id"
end
