class User < ActiveRecord::Base
  has_secure_password

  has_many :gleets
  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_likeable

  validates :username, uniqueness: true, length: { minimum: 5, too_short: "Username must be at least 5 characters", maximum: 20, too_long: "Username must be 20 characters or less"}
  validates :email, presence: true
  validate :email_is_valid_format
  validates :password, presence: true, length: { minimum: 6, too_short: "Password must be at least 6 characters" }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  def email_is_valid_format
    errors.add(:email, "Not a valid email address") unless self.email =~ VALID_EMAIL_REGEX
  end

end
