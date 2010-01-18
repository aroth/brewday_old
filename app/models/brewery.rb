class Brewery < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships, :uniq => true
  belongs_to :brewery_type
  has_many :brew_days
  has_many :recipes
  
  def brewers
    self.memberships.collect { |m| m.user if m.membership_type.name == 'Brewer' }.compact
  end
  
  def admins
    self.memberships.collect { |m| m.user if m.membership_type.name == 'Admin' }.compact
  end
  
  def owners
    self.memberships.collect { |m| m.user if m.membership_type.name == 'Owner' }.compact
  end
  
  
end