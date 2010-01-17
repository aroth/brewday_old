class Brewery < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships
  belongs_to :brewery_type
end