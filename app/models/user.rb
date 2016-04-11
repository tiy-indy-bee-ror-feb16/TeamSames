class User < ActiveRecord::Base
  has_secure_password
  has_many :gleets
  has_many :active_blocks, class_name:  "Blocking",
                           foreign_key: "blocker_id",
                           dependent:   :destroy
  has_many :passive_blocks, class_name: "Blocking",
                            foreign_key: "blocked_id",
                            dependent:  :destroy
  has_many :blocking, through: :active_blocks, source: :blocked
  has_many :blocked_by, through: :passive_blocks, source: :blocker
  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_likeable

  include PgSearch
  pg_search_scope :search, against: [:username, :email]

  before_validation :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :username, uniqueness: true,
                       length: { minimum: 5, too_short: "Username must be at least 5 characters",
                                 maximum: 25, too_long: "Username must be 25 characters or less" }
  validates :email, presence: true,
                    uniqueness: true,
                    case_sensitive: false
  validate :email_is_valid_format
  validates :password, presence: true,
                       length: { minimum: 6, too_short: "Password must be at least 6 characters" }


  def email_is_valid_format
    errors.add(:email, "Not a valid email address") unless self.email =~ VALID_EMAIL_REGEX
  end

  def blocking?(other_user)
    blocking.exists?(other_user)
  end

  def blocked_by?(other_user)
    blocked_by.exists?(other_user)
  end

  def block(other_user)
    active_blocks.create(blocked_id: other_user.id)
    unfollow!(other_user)
  end

  def unblock(other_user)
    active_blocks.find_by(blocked_id: other_user.id).destroy
  end

  private

  def downcase_email
    self.email = self.email.downcase if self.email.present?
  end

end
