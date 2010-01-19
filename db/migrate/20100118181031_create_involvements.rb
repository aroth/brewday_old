class CreateInvolvements < ActiveRecord::Migration
  def self.up
    create_table :involvements, :force => true do |t|
      t.integer :action_id
      t.integer :user_id
      t.string :role
      t.string :description
    end

  end

  def self.down
    drop_table :involvements
  end
end
