class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships, :force => true do |t|
      t.integer :user_id
      t.integer :brewery_id
      t.integer :membership_type_id
    end
  end

  def self.down
    drop_table :memberships
  end
end
