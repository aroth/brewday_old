class CreateBreweries < ActiveRecord::Migration
  def self.up
    create_table :breweries, :force => true do |t|
      t.integer :creator_id
      t.string :name
      t.text :about
      t.string :style, :limit => 15, :default => 'homebrew'
      t.timestamps
    end
  end

  def self.down
    drop_table :breweries
  end
end
