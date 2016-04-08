class Gleet < ActiveRecord::Base
  paginates_per 10
  belongs_to :user
  validates :body, presence: true
  validates :body, length: { maximum: 170, too_long: "%{count} characters is the maximum allowed" }

  def self.timeline(user)
    following_ids = user.followees(User).map(&:id)
    all_ids = following_ids << user.id
    Gleet.where(user_id: all_ids).order(created_at: :desc)
  end
  
end
