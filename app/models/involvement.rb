class Involvement < ActiveRecord::Base
  belongs_to :user
  belongs_to :action
end