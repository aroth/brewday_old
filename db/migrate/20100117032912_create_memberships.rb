class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships, :force => true do |t|
      t.integer :user_id
      t.integer :brewery_id
      t.string :role, :limit => 10  # use string for now, role_id later
    end
  end

  def self.down
    drop_table :memberships
  end
end
