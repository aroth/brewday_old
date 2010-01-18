class CreateTimelines < ActiveRecord::Migration
  def self.up
    create_table :timelines, :force => true do |t|
      t.integer :brew_day_id
      t.timestamps
    end

    create_table :timeline_entries, :force => true do |t|
      t.integer :timeline_id
      t.string :name
      t.string :description
      t.datetime :entry_timestamp
      t.timestamps
    end
  end

  def self.down
    drop_table :timelines
    drop_table :timeline_entries
  end
end
