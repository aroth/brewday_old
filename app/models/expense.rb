class Expense < ActiveRecord::Base
  belongs_to :expensable, :polymorphic => true
  has_many :expense_entries
  has_many :involvements
  has_many :users, :through => :involvements, :uniq => true
  
  def total
    Money.new( self.expense_entries.sum(:cents), 'USD' )
  end
  
end