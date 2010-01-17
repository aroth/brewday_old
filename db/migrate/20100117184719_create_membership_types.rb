class CreateMembershipTypes < ActiveRecord::Migration
  def self.up
    create_table :membership_types, :force => true do |t|
      t.string :name, :limit => 20
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :membership_types
  end
end
