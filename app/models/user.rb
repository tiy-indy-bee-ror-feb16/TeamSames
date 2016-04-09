class User < ActiveRecord::Base
  has_secure_password
  before_save { self.email = email.downcase }
  validates :email, presence: true,
                    uniqueness: true,
                    case_sensitive: false,
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Must be a valid email" }
  validates :password, presence: true,
                       length: { minimum: 6, too_short: "Password must be at least 6 characters" }
  has_many :gleets
  acts_as_follower
  acts_as_followable
  acts_as_liker
  acts_as_likeable
end
