class Gleet < ActiveRecord::Base
  paginates_per 10
  belongs_to :user
  validates :body, presence: true
  validates :body, length: { maximum: 170, too_long: "%{count} characters is the maximum allowed" }

  before_save :sparkalize

  include PgSearch
  pg_search_scope :search, against: [:body]

  def self.timeline(user)
    following_ids = user.followees(User, pluck: :id)
    all_ids = following_ids << user.id
    Gleet.where(user_id: all_ids).order(created_at: :desc)
  end

  def sparkalize
    txt = self.body
    txt.gsub!(/(ass)/i, 'sparkle')
    txt.gsub!(/(fag)/i, 'sparkle')
    txt.gsub!(/(shit)/i, 'sparkle')
    txt.gsub!(/(fuck)/i, 'sparkle')
    txt.gsub!(/(damn)/i, 'sparkle')
    txt.gsub!(/(crap)/i, 'sparkle')
    txt.gsub!(/(piss)/i, 'sparkle')
    txt.gsub!(/(dick)/i, 'sparkle')
    txt.gsub!(/(darn)/i, 'sparkle')
    txt.gsub!(/(cock)/i, 'sparkle')
    txt.gsub!(/(puss)/i, 'sparkle')
    txt.gsub!(/(slut)/i, 'sparkle')
    txt.gsub!(/(bitch)/i, 'sparkle')
    txt.gsub!(/(asshole)/i, 'sparkle')
    txt.gsub!(/(bastard)/i, 'sparkle')
  end
end
