# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100118182529) do

  create_table "beer_style_categories", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "beer_styles", :force => true do |t|
    t.integer  "beer_style_category_id"
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.string   "stats_ibus"
    t.string   "stats_og"
    t.string   "stats_fg"
    t.string   "stats_srm"
    t.string   "stats_abv"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brew_days", :force => true do |t|
    t.integer  "brewery_id"
    t.integer  "recipe_id"
    t.datetime "brew_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "breweries", :force => true do |t|
    t.integer  "creator_id"
    t.integer  "brewery_type_id"
    t.string   "name"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brewership_types", :force => true do |t|
    t.string   "name",        :limit => 20
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brewerships", :force => true do |t|
    t.integer "user_id"
    t.integer "brew_day_id"
    t.integer "brewership_type_id"
  end

  create_table "brewery_types", :force => true do |t|
    t.string   "name",        :limit => 20
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.string   "commentable_type", :limit => 20
    t.integer  "commentable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer  "user_id"
    t.string   "filename"
    t.string   "name"
    t.text     "description"
    t.string   "content_type"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.string   "imageable_type", :limit => 15
    t.integer  "imageable_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "images", ["imageable_type", "imageable_id", "user_id"], :name => "index_images_on_imageable_type_and_imageable_id_and_user_id"
  add_index "images", ["imageable_type", "imageable_id"], :name => "index_images_on_imageable_type_and_imageable_id"
  add_index "images", ["user_id"], :name => "index_images_on_user_id"

  create_table "membership_types", :force => true do |t|
    t.string   "name",        :limit => 20
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships", :force => true do |t|
    t.integer "user_id"
    t.integer "brewery_id"
    t.integer "membership_type_id"
  end

  create_table "recipes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "brewery_id"
    t.integer  "beer_style_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "timeline_entries", :force => true do |t|
    t.integer  "timeline_id"
    t.string   "name"
    t.string   "description"
    t.datetime "entry_timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timelines", :force => true do |t|
    t.integer  "brew_day_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                            :null => false
    t.string   "crypted_password",                 :null => false
    t.string   "password_salt",                    :null => false
    t.string   "persistence_token",                :null => false
    t.integer  "login_count",       :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
  end

  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["login"], :name => "index_users_on_login"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
