class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships, :force => true do |t|
      t.integer :user_id
      t.integer :brewery_id
      t.integer :membership_type_id
    end

    create_table :membership_types, :force => true do |t|
      t.string :name, :limit => 20
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :memberships
    drop_table :membership_types
  end
end
