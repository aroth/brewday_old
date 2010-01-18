class CreateBrewDays < ActiveRecord::Migration
  def self.up
    create_table :brew_days, :force => true do |t|
      t.integer :brewery_id
      t.integer :recipe_id
      t.datetime :brew_date
      t.timestamps
    end
  end

  def self.down
    drop_table :brew_days
  end
end
