class User < ActiveRecord::Base
  acts_as_authentic

  has_many :memberships
  has_many :breweries, :through => :memberships, :uniq => true
end
