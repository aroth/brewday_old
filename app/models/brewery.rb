class Brewery < ActiveRecord::Base

  belongs_to :brewery_type

  has_many :memberships
  has_many :users, :through => :memberships, :uniq => true
  has_many :batches
  has_many :recipes
  has_many :beer_styles, :through => :recipes, :uniq => true
  has_many :actions, :as => :actionable, :dependent => :destroy
  has_many :expenses, :as => :expensable, :dependent => :destroy
  
  has_one :timeline
  
  
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