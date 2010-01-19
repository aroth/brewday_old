class Action < ActiveRecord::Base
  #belongs_to :actionable, :polymorphic => true -- not yet. reduce complexity.
  belongs_to :batch
  has_many :action_entries
  has_many :involvements
  has_many :users, :through => :involvements, :uniq => true
end