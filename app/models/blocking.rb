class Blocking < ActiveRecord::Base
  belongs_to :blocker, class_name: 'User'
  belongs_to :blocked, class_name: 'User'
  validates :blocker_id, :blocked_id, presence: true
end
