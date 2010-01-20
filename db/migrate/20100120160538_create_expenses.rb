class CreateExpenses < ActiveRecord::Migration
  def self.up
    create_table :expenses, :force => true do |t|
      t.string :name
      t.datetime :timestamp
      t.string :expensable_type
      t.string :expensable_id
      t.timestamps
    end

    create_table :expense_entries, :force => true do |t|
      t.integer :expense_id
      t.string :name
      t.string :description
      t.integer :cents
      t.string :currency
      t.datetime :timestamp
      t.timestamps
    end
    
  end

  def self.down
    drop_table :expenses, :expense_entries
  end
end
