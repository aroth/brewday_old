class Action < ActiveRecord::Base
  belongs_to :actionable, :polymorphic => true
  has_many :action_entries
  has_many :involvements
  has_many :users, :through => :involvements, :uniq => true
end