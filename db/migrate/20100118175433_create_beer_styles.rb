class CreateBeerStyles < ActiveRecord::Migration
  def self.up
    create_table :beer_style_categories, :force => true do |t|
      t.string :name
      t.string :code
      t.timestamps
    end
    
    create_table :beer_styles, :force => true do |t|
      t.integer :beer_style_category_id
      t.string :name
      t.string :code
      t.text :description
      t.string :stats_ibus
      t.string :stats_og
      t.string :stats_fg
      t.string :stats_srm
      t.string :stats_abv
      t.timestamps
    end
  end

  def self.down
    drop_table :beer_style_categories
    drop_table :beer_styles
  end
end
