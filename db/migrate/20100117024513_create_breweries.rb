class CreateBreweries < ActiveRecord::Migration
  def self.up
    create_table :breweries, :force => true do |t|
      t.integer :creator_id
      t.integer :brewery_type_id
      t.string :name
      t.text :about
      t.timestamps
    end
  end

  def self.down
    drop_table :breweries
  end
end
