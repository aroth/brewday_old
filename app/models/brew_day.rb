class BrewDay < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :recipe
end