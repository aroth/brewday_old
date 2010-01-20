class ExpenseEntry < ActiveRecord::Base
  belongs_to :expense
  composed_of :price, :class_name => "Money", :mapping => [%w(cents cents), %w(currency currency)]
end