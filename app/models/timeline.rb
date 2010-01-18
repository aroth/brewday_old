class Timeline < ActiveRecord::Base
  belongs_to :brew_day
  has_many :timeline_entries
end