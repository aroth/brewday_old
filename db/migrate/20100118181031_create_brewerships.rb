class CreateBrewerships < ActiveRecord::Migration
  def self.up
    create_table :brewerships, :force => true do |t|
      t.integer :user_id
      t.integer :brew_day_id
      t.integer :brewership_type_id
    end

    create_table :brewership_types, :force => true do |t|
      t.string :name, :limit => 20
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :brewerships
    drop_table :brewership_types
  end
end
