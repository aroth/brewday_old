class BrewDay < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :recipe

  has_many :brewerships
  has_many :users, :through => :brewerships, :uniq => true
  has_one :timeline
end