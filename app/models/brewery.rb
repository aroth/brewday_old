class Brewery < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships
  belongs_to :brewery_type
  
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