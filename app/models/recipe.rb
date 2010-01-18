class Recipe < ActiveRecord::Base
  #belongs_to :user
  belongs_to :brewery
  has_many :recipes
end