class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :brewery
  belongs_to :membership_type
end