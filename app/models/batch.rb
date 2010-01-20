class Batch < ActiveRecord::Base
  belongs_to :brewery
  belongs_to :recipe

  has_many :involvements
  has_many :users, :through => :involvements, :uniq => true
  has_many :actions, :as => :actionable, :dependent => :destroy
  has_many :expenses, :as => :expensable, :dependent => :destroy
  
  #has_many :images, :as => :imageable, :dependent => :destroy, :order => "position ASC"
  #has_many :comments, :as => :commentable, :dependent => :destroy, :order => 'created_at DESC'
end