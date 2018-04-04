
ActiveRecord::Schema.define(version: 20180403091625) do

  enable_extension "plpgsql"

  create_table "pictures", force: :cascade do |t|
    t.text "image"
    t.string "title"
    t.text "content"
    t.string "user_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
