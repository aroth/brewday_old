class CreateImages < ActiveRecord::Migration
  def self.up
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
      t.integer :position
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    add_index :images, :user_id
    add_index :images, [:imageable_type, :imageable_id]
    add_index :images, [:imageable_type, :imageable_id, :user_id]
  end

  def self.down
    drop_table :images
  end
end