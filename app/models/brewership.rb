class Brewership < ActiveRecord::Base
  belongs_to :user
  belongs_to :brew_day
  belongs_to :brewership_type
end