class CreateActions < ActiveRecord::Migration
  def self.up
    create_table :actions, :force => true do |t|
      t.integer :batch_id
      t.string :name
      t.datetime :timestamp
      t.timestamps
    end

    create_table :action_entries, :force => true do |t|
      t.integer :action_id
      t.string :name
      t.string :description
      t.datetime :timestamp
      t.timestamps
    end
    
  end

  def self.down
    drop_table :actions, :action_entries
  end
end
