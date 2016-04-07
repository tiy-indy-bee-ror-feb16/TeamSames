class Gleet < ActiveRecord::Base
  belongs_to :user
  validates :body, presence: true
  validates :body, length: { maximum: 170, too_long: "%{count} characters is the maximum allowed" }
end
