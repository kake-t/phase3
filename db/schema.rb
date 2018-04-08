
ActiveRecord::Schema.define(version: 20180408094846) do

  enable_extension "plpgsql"

  create_table "pictures", force: :cascade do |t|
    t.text "image"
    t.string "title"
    t.text "content"
    t.string "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_pictures_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "pictures", "users"
end
