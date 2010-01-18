class Recipe < ActiveRecord::Base
  #belongs_to :user
  belongs_to :brewery
  belongs_to :beer_style
  #belongs_to :beer_style_category, :through => :beer_style
end