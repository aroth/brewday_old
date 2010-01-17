class CreateBreweryTypes < ActiveRecord::Migration
  def self.up
    create_table :brewery_types, :force => true do |t|
      t.string :name, :limit => 20
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :brewery_types
  end
end
