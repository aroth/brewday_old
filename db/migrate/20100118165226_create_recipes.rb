class CreateRecipes < ActiveRecord::Migration
  def self.up
    create_table :recipes, :force => true do |t|
      t.integer :user_id
      t.integer :brewery_id
      t.integer :beer_style_id
      t.string :name
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :recipes
  end
end
