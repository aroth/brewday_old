class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  validates_presence_of :body, :user
  
  def is_deleteable_by?( user )
    if user
      self.is_owned_by?( user ) or self.commentable.user == user
    end
  end
  
  def is_owned_by?( user )
    if user
      return self.user == user
    end
  end
  
end