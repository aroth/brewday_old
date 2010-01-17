class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments, :force => true do |t|
      t.integer :user_id
      t.text :body
      t.string :commentable_type, :limit => 20
      t.integer :commentable_id
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end