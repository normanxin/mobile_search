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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121118045459) do

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "publisher"
    t.string   "image_url"
    t.integer  "counter"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "google_play_id"
    t.string   "google_play_lower_counter"
    t.string   "app_version"
    t.string   "date_published"
    t.string   "android_version_required"
    t.string   "price"
    t.float    "rating"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "app_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friends", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "profile_type"
    t.integer  "health"
    t.integer  "productivity"
    t.integer  "education"
    t.integer  "lifestyle"
    t.integer  "social"
    t.integer  "game"
    t.integer  "weather"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_app_lists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "app_id"
    t.boolean  "recommendation"
    t.integer  "usage"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "gender"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
