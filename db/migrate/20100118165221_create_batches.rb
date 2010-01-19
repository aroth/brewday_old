class CreateBatches < ActiveRecord::Migration
  def self.up
    create_table :batches, :force => true do |t|
      t.integer :brewery_id
      t.integer :recipe_id
      t.integer :index
      t.datetime :batch_date
      t.timestamps
    end
  end

  def self.down
    drop_table :batches
  end
end